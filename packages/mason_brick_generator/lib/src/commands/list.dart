import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../l.dart';

///
class ListCommand extends BrandCommand<void> {
  ListCommand() : super(L.listCommandName, L.listCommandDescription);

  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    final progress = logger.progress(L.listProcessing);
    final list = await getBricks();
    progress.cancel();
    logInfo(L.listResultLabel);
    for (final template in list) {
      logInfo(' ⌙ ${template.asChoice}');
    }
    final result = logger.confirm(L.listPrompGenerte);
    if (result) {
      await runner?.run([L.generateCommandName]);
    }
  }
}
