import 'package:universal_io/io.dart';

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

  /// Create a new brick in folder structure
  Future<void> createBrick({required String name, String description = ''}) async {
    final folder = Directory(Constants.bricksFolder);
    if (!folder.existsSync()) folder.createSync(recursive: true);
    await removeBrick(name);
    await Process.run(
      'mason',
      [
        'new',
        name,
        '--desc',
        description,
        '--hooks',
        '-o',
        Directory(Constants.bricksFolder).path,
      ],
      runInShell: true,
    );
  }

  Future<void> createPostgen() async {
    logger.alert('Do you want to continue?');
  }
}
