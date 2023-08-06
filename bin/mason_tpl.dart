import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:mason_tpl/src/commands/command_runner.dart';
import 'package:mason_tpl/src/domain/exceptions/exceptions.dart';

Future<void> main(List<String> args) async {
  final logger = Logger();
  try {
    final runner = MasonTplCommandRunner();
    // await runner.initialize();
    await runner.run(args);
  } on MasonNotInitialized catch (e) {
    logger
      ..err(e.toString())
      ..warn('initialize mason first `mason init`');

    exit(64);
  } on MasonTplNotInitialized catch (e) {
    logger.err(e.toString());
    exit(64);
  } catch (e) {
    logger.err('$e');
    exit(64);
  }
}
