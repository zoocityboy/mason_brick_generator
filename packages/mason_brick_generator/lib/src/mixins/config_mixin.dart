import 'package:universal_io/io.dart';

import '../constants.dart';
import '../domain/config/config_yaml.dart';
import 'processes.dart';

///
mixin ConfigMixin {
  /// Check if [mason] was initialized
  bool isMasonInstalled() {
    try {
      Process.runSync('mason', ['-h'], runInShell: true);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Check if [mason] was initialized
  bool isMasonInitialized() {
    return File(Constants.masonConfigFileName).existsSync();
  }

  /// Check if [mason_brick_generator] was initialized
  bool isMasonTplInitialized() {
    return File(
      Constants.masonTplConfigFileName,
    ).existsSync();
  }

  String get sampleTemplatePath =>
      [Directory.current.path, 'lib', Constants.masonSampleTamplateName].join(Platform.pathSeparator);
  bool existsSampleTemplate() => Directory(sampleTemplatePath).existsSync();

  String get sampleBrickPath =>
      [Directory.current.path, Constants.bricksFolder, Constants.masonSampleBrickName].join(Platform.pathSeparator);
  bool existsSampleBrick() => Directory(sampleBrickPath).existsSync();

  Future<void> initializeMason() async {
    await Shell.run('mason', ['init']);
  }

  Future<void> installMason() async {
    await Shell.run('dart', ['pub', 'global', 'activate', 'mason']);
  }

  ///
  Future<ConfigYaml> getConfig() async {
    return config ??= await ConfigYaml.loadFromPubspec();
  }

  ConfigYaml? config;
}
