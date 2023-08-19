import 'package:mason_logger/mason_logger.dart';
import 'package:meta/meta.dart';

/// Mixin for Console interaction
mixin ConsoleMixin {
  /// Logger instance
  final logger = Logger();

  @protected
  void logError(String message) {
    logger.err(message);
  }

  @protected
  void logWarning(String message) {
    logger.warn(message, tag: '・');
  }

  @protected
  void logInfo(String message) {
    logger.info(message);
  }

  @protected
  Progress logProgress(String message) {
    return logger.progress(message, options: const ProgressOptions());
  }

  @protected
  void progressComplete(Progress progress, {String? message}) {
    progress.complete(message);
  }
}
