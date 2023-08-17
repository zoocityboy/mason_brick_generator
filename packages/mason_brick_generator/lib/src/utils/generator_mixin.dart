import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

import '../constants.dart';
import '../domain/config/replace_variable_properties.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../localisation.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';
import 'mason_mixin.dart';
import 'processes.dart';

///
mixin GeneratorMixin on MasonMixin, MasonBrickMixin, MasonWorkspaceMixin, ConsoleMixin, ConfigMixin {
  /// Remove previous version and create new folder
  @protected
  Future<void> preProcess(TemplateYaml tpl) async {
    await makeTemplateFromBundle(tpl);
    await Shell.mkdir(tpl.processTagetPath);
    await Shell.cp(tpl.processSourcePath, tpl.processTagetPath);
  }

  /// postProcess will clear temporary files created by generator process
  Future<void> postProcess(TemplateYaml tpl) async {
    final temp = Directory(tpl.processTagetPath);
    if (temp.existsSync()) {
      await Shell.rm(tpl.processTagetPath);
    }
  }

  /// Generate a new template
  Future<void> generateTemplate(TemplateYaml tpl) async {
    var progress = logger.progress(Localisation.generating);
    try {
      await preProcess(tpl);
      progress.complete();
    } catch (e) {
      progress.fail();
      throw FolderProcessingFailed('$e');
    }

    progress = logger.progress('${tpl.name} - ${Localisation.processing}');
    final files = Directory(tpl.processTagetPath)
        .listSync(recursive: true)
        .whereType<File>()
        .where(
          (element) => !element.path.endsWith('.DS_Store'),
        )
        .toList();
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

    progress = logger.progress(Localisation.postprocessing);

    /// Remote default template
    await postProcess(tpl);
    // done
    progress.complete();
  }

  /// Copy processed file to target location
  Future<void> path(TemplateYaml tpl, File file, List<String> targetPathSegments) async {
    final newPath = p.join(tpl.processTargetRootPath, targetPathSegments.join(Platform.pathSeparator));
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
    if (isImportLine) {
      line = processImport(line, entries);
    } else {
      for (final pair in entries) {
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
    final filePathSegments = file.path.split(Platform.pathSeparator).sublist(3);
    print('${file.path} -> $filePathSegments');
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
    print('${file.path} -> $newPathSegments');
    return newPathSegments;
  }

  /// Generate post gen script
  @protected
  Future<void> postgen() async {}

  /// Generate pre gen script
  @protected
  Future<void> pregen() async {}
}
