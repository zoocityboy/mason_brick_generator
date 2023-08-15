import 'dart:io';

import 'package:mason_brick_generator/src/commands/command_runner.dart';
import 'package:mason_brick_generator/src/domain/exceptions/exceptions.dart';
import 'package:mason_logger/mason_logger.dart';

Future<void> main(List<String> args) async {
  final logger = Logger();
  try {
    final runner = MasonTplCommandRunner();
    await runner.run(args);
  } on MasonTplException catch (e) {
    logger.err(e.message);
    exit(64);
  } catch (e) {
    logger.err('$e');
    exit(64);
  }
}
