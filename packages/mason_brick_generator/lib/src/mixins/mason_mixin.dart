import 'package:json2yaml/json2yaml.dart';
import 'package:mason/mason.dart';
import 'package:universal_io/io.dart';

import '../../bundle/mbg_template_bundle.dart';
import '../../bundle/mbg_workspace_bundle.dart';
import '../constants.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../l.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';

part 'mason_brick_mixin.dart';
part 'mason_workspace_mixin.dart';

/// Simple brick format
typedef SimpleBrick = (String name, String description, String source);

/// Basic operation with Mason CLI
mixin MasonMixin on ConsoleMixin, ConfigMixin {
  String stripHtmlIfNeeded(String text) {
    return text.replaceAll(RegExp('<[^>]*>|&[^;]+;'), ' ');
  }

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
      logWarning(L.initQuestionInstallMason);
      final response = logger.confirm(L.initPromptInititalizeMason);
      if (!response) {
        throw const MasonNotInitialized(
          Constants.masonConfigFileName,
        );
      }
      final progress = logger.progress(L.initProcessingMasonInstallation);
      await installMason();
      progress.complete();
    }
    if (!isMasonInitialized()) {
      logWarning(L.initQuestionInititalizeMason);
      final response = logger.confirm(L.initPromptInititalizeMason);
      if (!response) {
        throw const MasonNotInitialized(
          Constants.masonConfigFileName,
        );
      }
      final progress = logger.progress(L.initProcessingMasonInitialization);
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
