import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../localisation.dart';

///
class ListCommand extends BrandCommand<void> {
  ListCommand() : super(Localisation.listCommandName, Localisation.listCommandDescription);

  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    final progress = logger.progress(Localisation.listProcessing);
    final list = await getBricks();
    progress.cancel();
    logInfo(Localisation.listResultLabel);
    for (final template in list) {
      logInfo(' ⌙ ${template.asChoice}');
    }
    final result = logger.confirm(Localisation.listPrompGenerte);
    if (result) {
      await runner?.run([Localisation.generateCommandName]);
    }
  }
}
