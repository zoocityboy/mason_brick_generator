import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

import '../constants.dart';
import '../domain/config/replace_variable_properties.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../l.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';
import 'mason_mixin.dart';
import 'processes.dart';

/// Process
/// 1. preprocess: Copy source files to brick source destination __brick_source__
/// 2. process: Replace variables
///   1. Replace variables,
///   2. update path
///   3. Copy template files to brick (__brick__) destination
/// 3. postprocess: Clear temporary files
mixin GeneratorMixin on MasonMixin, MasonBrickMixin, MasonWorkspaceMixin, ConsoleMixin, ConfigMixin {
  /// Remove previous version and create new folder
  @protected
  Future<void> preProcess(TemplateYaml tpl) async {
    await makeTemplateFromBundle(tpl);
    if (tpl.files.isNotEmpty) {
      for (final filePath in tpl.files) {
        final sourceFile = File(filePath);
        final destinationPath = tpl.brickSourcePath(filePath);
        final destinationFile = File(destinationPath);
        if (!destinationFile.parent.existsSync()) {
          Directory(destinationFile.parent.path).createSync(recursive: true);
        }
        sourceFile.copySync(tpl.brickSourcePath(filePath));
        // await Shell.cp(p.join(tpl.templateTargetPath, file), tpl.processTargetPathFromFileNode(file));
      }
    } else {
      await Shell.mkdir(tpl.brickSourceFolderPath);
      await Shell.cp(tpl.appSourcePath, tpl.brickSourceFolderPath);
    }
  }

  /// postProcess will clear temporary files created by generator process
  Future<void> postProcess(TemplateYaml tpl) async {
    final temp = Directory(tpl.brickSourceDestinationPath);
    if (temp.existsSync()) {
      await Shell.rm(tpl.brickSourceDestinationPath);
    }
  }

  /// Generate a new template
  Future<void> generateTemplate(TemplateYaml tpl) async {
    var progress = logger.progress(L.generating);
    try {
      await preProcess(tpl);
      progress.complete();
    } catch (e) {
      progress.fail();
      throw FolderProcessingFailed('$e');
    }

    progress = logger.progress('${tpl.name} - ${L.processing}');
    final files = <File>[];
    if (tpl.source != '/') {
      final files0 = Directory(tpl.brickSourceFolderPath)
          .listSync(recursive: true)
          .whereType<File>()
          .where(
            (element) => !element.path.endsWith('.DS_Store'),
          )
          .toList();
      files.addAll(files0);
    } else {
      final templateFiles = tpl.files
          .map(
            (e) => File(p.join(Directory.current.path, tpl.brickSourcePath(e))),
          )
          .toList();
      files.addAll(templateFiles);
    }

    progress.complete();
    for (final _ in files) {
      final file = _;
      logInfo('$file');

      /// Replace content
      await replaceContent(tpl, file);

      ///
      final value = await replacePath(tpl, file);

      /// Replace paths
      await path(tpl, file, value);
    }

    progress = logger.progress(L.postprocessing);

    /// Remote default template
    await postProcess(tpl);
    // done
    progress.complete();
  }

  /// Copy processed file to target location
  Future<void> path(TemplateYaml tpl, File file, List<String> targetPathSegments) async {
    final root = targetPathSegments.sublist(3).join(Platform.pathSeparator);
    final newPath = p.join(tpl.brickDestinationPath, root);

    final rel = p.relative(newPath, from: tpl.brickRootPath);
    await File(newPath).create(recursive: true);
    await file.rename(newPath);
  }

  /// Replace tokens in body of file
  @protected
  Future<void> replaceContent(TemplateYaml tpl, File _) async {
    final file = _;
    final sb = StringBuffer();
    final lineContents = file.readAsLinesSync();
    for (final line in lineContents) {
      sb.writeln(processLine(tpl, line));
    }
    await file.writeAsString(sb.toString());
  }

  /// Process line replace
  @protected
  String processLine(TemplateYaml tpl, String _) {
    var line = _;
    final isImportLine = line.trim().startsWith('import ');
    final entries = tpl.replace
        .where((e) => e.type == (isImportLine ? ReplaceVariableType.import : ReplaceVariableType.content))
        .toList();
    final prefixedEnteries = entries.where((e) => e.prefix != null).toList();
    final unprefixedEnteries = entries.where((e) => e.prefix == null).toList();
    if (isImportLine) {
      line = processImport(line, entries);
    } else {
      for (final pair in prefixedEnteries) {
        line = '${pair.prefix}${line.replaceAll(pair.name, pair.value)}${pair.suffix}';
      }
      for (final pair in unprefixedEnteries) {
        line = line.replaceAll(pair.name, pair.value);
      }
    }
    return line;
  }

  /// Process import line
  @protected
  String processImport(String _, List<ReplaceVariableProperties> entries) {
    var line = _;

    /// Get import content
    final importSegments = Constants.importLineContent.firstMatch(line)?.group(1);
    if (importSegments != null) {
      final fileSegments = importSegments.split('/');
      final newSegments = <String>[];
      var pre = '';
      var post = '';
      for (final segment in fileSegments) {
        var newSegmentItem = segment;
        for (final i in entries) {
          if (newSegmentItem.contains(i.name) || newSegmentItem == i.name) {
            if (i.prefix != null && i.suffix != null) {
              pre = i.prefix!;
              post = i.suffix!;
            }
            newSegmentItem = newSegmentItem.replaceAll(i.name, i.value);
          }
          newSegments.add(newSegmentItem);
        }
      }
      line = "${pre}import '${newSegments.join('/')}';$post";
    }
    return line;
  }

  /// Replace path tokens with definition from Template
  @protected
  Future<List<String>> replacePath(TemplateYaml tpl, File file) async {
    final rel = p.relative(file.path, from: Directory.current.path);
    final filePathSegments = rel.split(Platform.pathSeparator);
    final newPathSegments = <String>[];
    final entries = tpl.replace.where((e) => e.type == ReplaceVariableType.path).toList();
    for (final segment in filePathSegments) {
      var newSegmentItem = segment;
      for (final i in entries) {
        if (newSegmentItem.contains(i.name) || newSegmentItem == i.name) {
          if (i.prefix != null && i.suffix != null) {
            newSegmentItem = '${newSegmentItem.replaceAll(i.name, '${i.prefix ?? ''}${i.value}')}${i.suffix ?? ''}';
          } else {
            newSegmentItem = newSegmentItem.replaceAll(i.name, i.value);
          }
        }
      }
      newPathSegments.add(newSegmentItem);
    }
    return newPathSegments;
  }

  /// Generate post gen script
  @protected
  Future<void> postgen() async {}

  /// Generate pre gen script
  @protected
  Future<void> pregen() async {}
}
