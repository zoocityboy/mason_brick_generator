import 'package:json2yaml/json2yaml.dart';
import 'package:mason/mason.dart';
import 'package:universal_io/io.dart';

import '../../bundle/mbg_template_bundle.dart';
import '../../bundle/mbg_workspace_bundle.dart';
import '../constants.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../localisation.dart';
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

  Future<void> initialize() async {
    if (!isMasonInstalled()) {
      logger.warn(Localisation.initQuestionInstallMason);
      final response = logger.confirm(Localisation.initPromptInititalizeMason);
      if (!response) {
        throw const MasonNotInitialized(
          Constants.masonConfigFileName,
        );
      }
      final progress = logger.progress(Localisation.initProcessingMasonInstallation);
      await installMason();
      progress.complete();
    }
    if (!isMasonInitialized()) {
      logger.warn(Localisation.initQuestionInititalizeMason);
      final response = logger.confirm(Localisation.initPromptInititalizeMason);
      if (!response) {
        throw const MasonNotInitialized(
          Constants.masonConfigFileName,
        );
      }
      final progress = logger.progress(Localisation.initProcessingMasonInitialization);
      await initializeMason();
      progress.complete();
    }
  }

  Future<void> desetroy() async {
    if (isMasonInitialized()) {
      File(Constants.masonConfigFileName).deleteSync(recursive: true);
    }
    if (isMasonTplInitialized()) {
      File(Constants.masonTplConfigFileName).deleteSync(recursive: true);
    }
    if (existsSampleTemplate()) {
      Directory(sampleTemplatePath).deleteSync(recursive: true);
    }
    if (existsSampleBrick()) {
      Directory(sampleBrickPath).deleteSync(recursive: true);
    }
  }
}
mixin MasonBrickMixin on MasonMixin {
  Future<void> makeTemplateFromBundle(TemplateYaml tpl) async {
    final generator = await MasonGenerator.fromBundle(mbgTemplateBundle);
    final data = {'vars': tpl.varsToJson()};
    await generator.generate(
      DirectoryGeneratorTarget(Directory(tpl.templateTargetPath)),
      logger: logger,
      vars: {
        'mbg_template_name': tpl.name,
        'mbg_template_description': tpl.description,
        'mbg_template_vars': json2yaml(data),
      },
    );
  }
}
mixin MasonWorkspaceMixin on MasonMixin {
  Future<void> makeWorkspaceFromBundle() async {
    final generator = await MasonGenerator.fromBundle(mbgWorkspaceBundle);
    await generator.generate(
      DirectoryGeneratorTarget(Directory.current),
      logger: logger,
      vars: {
        'mbg_name': 'Mason Brick Generator - wildest animal in the zoo.',
        'mbg_description': 'This is configuration file for Mason Brick Generator',
        'mbg_file_class_name': '{{name.snakeCase()}}',
        'mbg_var_class_name': '{{name.pascalCase()}}',
      },
    );
  }
}
