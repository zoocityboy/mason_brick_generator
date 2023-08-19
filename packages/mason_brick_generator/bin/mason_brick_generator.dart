import 'dart:io';

import 'package:mason_brick_generator/src/commands/command_runner.dart';
import 'package:mason_brick_generator/src/domain/exceptions/exceptions.dart';
import 'package:mason_logger/mason_logger.dart';

Future<void> main(List<String> args) async {
  final logger = Logger(
    theme: LogTheme(
      detail: (m) => darkGray.wrap(m),
      info: (m) => lightGray.wrap(m),
      err: (m) => red.wrap(m),
      warn: (m) => lightYellow.wrap(m),
      alert: (m) => backgroundLightRed.wrap(white.wrap(m)),
      success: (m) => lightGreen.wrap(m),
    ),
  );
  try {
    final runner = MasonTplCommandRunner();
    await runner.run(args);
  } on MasonTplException catch (e) {
    logger.err('\n✗ ${e.message}');
    exit(64);
  } catch (e) {
    logger.err('\n✗ ${e.runtimeType}\n$e');
    exit(64);
  }
}
