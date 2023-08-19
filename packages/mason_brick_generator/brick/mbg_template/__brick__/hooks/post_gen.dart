import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('MBG Template {{name}}!');
  final file = File('.post_gen.txt');
  file.writeAsStringSync('${context.vars}');
}
