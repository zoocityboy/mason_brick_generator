import 'package:universal_io/io.dart';

import '../constants.dart';

mixin CheckMixin {
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

  /// Check if [mason_tpl] was initialized
  bool isMasonTplInitialized() {
    return File(
      Constants.masonTplConfigFileName,
    ).existsSync();
  }
}
