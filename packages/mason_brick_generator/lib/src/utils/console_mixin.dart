import 'package:mason_logger/mason_logger.dart';

/// Mixin for Console interaction
mixin ConsoleMixin {
  /// Logger instance
  final logger = Logger();
  void logError(String message) {
    logger.err(message);
  }

  void logWarning(String message) {
    logger.warn(message);
  }

  void logInfo(String message) {
    logger.info(message);
  }

  Progress logProgress(String message) {
    return logger.progress(message);
  }

  void progressComplete(Progress progress, {String? message}) {
    progress.complete(message);
  }
}
