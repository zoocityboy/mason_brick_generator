import 'package:universal_io/io.dart';

import '../constants.dart';
import '../domain/config/config_yaml.dart';
import '../domain/exceptions/exceptions.dart';

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

  ///
  Future<ConfigYaml> getConfig() async {
    return config ??= await ConfigYaml.loadFromPubspec();
  }

  ConfigYaml? config;

  Future<void> initialize() async {
    config ??= await ConfigYaml.loadFromPubspec();
    if (!isMasonInitialized()) {
      throw const MasonNotInitialized(
        Constants.masonConfigFileName,
      );
    }
    if (!isMasonTplInitialized()) {
      throw const MasonTplNotInitialized(
        Constants.masonTplConfigFileName,
      );
    }
    if (!isMasonTplInitialized()) {}
  }
}
