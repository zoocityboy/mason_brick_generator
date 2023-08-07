import 'package:collection/collection.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:mason/mason.dart';
import 'package:universal_io/io.dart';

import '../../bundle/tpl_template_name_bundle.dart';
import '../constants.dart';
import '../domain/config/template_yaml.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';

/// Simple brick format
typedef SimpleBrick = (String name, String description, String source);

/// Basic operation with Mason CLI
mixin MasonMixin on ConsoleMixin, ConfigMixin {
  /// Create a new folder structure
  Future<List<TemplateYaml>> getBricks() async {
    final config = await getConfig();
    return config.masonTpl;
  }

  ///
  Future<void> exists() async {}

  /// remove brick folder if exists
  Future<void> removeBrick(String name) async {
    final path = [Directory.current.path, Constants.bricksFolder, name].join(Platform.pathSeparator);
    final dir = Directory(path);
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }

  Future<void> createPostgen() async {
    logger.alert('Do you want to continue?');
  }

  Future<void> makeFromBundle(TemplateYaml tpl) async {
    final vars = tpl.varsToJson();
    final generator = await MasonGenerator.fromBundle(tplTemplateNameBundle);
    await generator.generate(
      DirectoryGeneratorTarget(Directory(tpl.templateTargetPath)),
      logger: logger,
      vars: vars,
    );
    await processBundle(tpl);
  }

  /// Process basic bundle with custom values
  Future<void> processBundle(TemplateYaml tpl) async {
    final directory = Directory(tpl.templateTargetPath);
    if (!directory.existsSync()) directory.createSync(recursive: true);
    directory.listSync().whereType<File>().forEach((file) {
      var content = file.readAsStringSync();
      final data = {'vars': tpl.varsToJson()};
      content = content
          .replaceAll('tpl_template_name', tpl.name)
          .replaceAll('tpl_template_description', tpl.description)
          .replaceAll('vars:', json2yaml(data));
      file.writeAsStringSync(content);
    });
  }
}
