import 'package:mason_logger/mason_logger.dart';
import 'package:universal_io/io.dart';

import '../domain/config/replace_variable_properties.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../domain/extensions/string.dart';
import '../l.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';
import 'mason_mixin.dart';

mixin ValidateMixin on ConsoleMixin, ConfigMixin, MasonMixin {
  Future<void> validate() async {
    final progress = logger.progress(L.listProcessing);
    final config = await getConfig();
    progress.complete();
    final selected = await chooseTemplates(config.temaplates);
    for (final tpl in selected) {
      final progress = logger.progress(' ⌙ ${tpl.name} - ${L.processing}');
      try {
        await tpl.validateSource(progress);
        progress.complete(' Template ${tpl.name} is valid.');
      } on MasonTplException catch (e) {
        progress.fail(' Template ${tpl.name} is not valid ${e.message}');
        rethrow;
      }
    }
  }

  Future<List<TemplateYaml>> chooseTemplates(List<TemplateYaml> templates) async {
    final selectedTemplates = logger.chooseAny<TemplateYaml>(
      L.generateChoosen,
      choices: templates,
      display: (choice) => choice.asChoice,
    );
    return selectedTemplates;
  }
}

extension TemplateYamlValidation on TemplateYaml {
  String get validateTemplatePrefix => ' $name - ';
  Future<void> validateSource(Progress progress) async {
    await validateStructure(progress);
    await validatePath(progress);
    await validateSourceContent(progress);
  }

  Future<void> validateStructure(Progress progress) async {
    progress.update('$validateTemplatePrefix${L.validateStructureProcessing}');
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  Future<void> validatePath(Progress progress) async {
    progress.update('$validateTemplatePrefix${L.validatePathProcessing}');
    await Future<void>.delayed(const Duration(seconds: 1));
    final path = [Directory.current.path, source.osPath].join(Platform.pathSeparator);
    if (!Directory(path).existsSync()) {
      throw InvalidTemplate('$source not found as $path');
    }
  }

  Future<void> validateSourceContent(Progress progress) async {
    progress.update('$validateTemplatePrefix${L.validateContentProcessing}');
    await Future<void>.delayed(const Duration(seconds: 1));
    final found = replace.toSearchMapWithDefault();
    final files = Directory(appSourcePath)
        .listSync(recursive: true)
        .whereType<File>()
        .where(
          (element) => !element.path.endsWith('.DS_Store'),
        )
        .toList();
    if (files.isEmpty) {
      throw InvalidTemplate('$brickSourceFolderPath not found');
    }
    for (final file in files) {
      progress.update('$validateTemplatePrefix${L.validateContentProcessing} at $file');
      await validateFile(file.path);
      progress.update('$validateTemplatePrefix${L.validateContentProcessing} at $file');
      await validateVariables(file.path);
    }
  }

  Future<void> validateFile(String path) async {
    final file = File(path);
    if (file.existsSync()) {
    } else {
      throw InvalidTemplate('File not found as $path');
    }
  }

  Future<Map<String, bool>> validateVariables(String path) async {
    final file = File(path);
    final lineContents = file.readAsLinesSync();
    final found = replace.toSearchMapWithDefault();
    for (final item in replace) {
      for (final line in lineContents) {
        if (line.contains(item.name)) {
          found[item.name] = true;
        }
      }
    }
    stdout.writeln('$found');
    return found;
  }
}
