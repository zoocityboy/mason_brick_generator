import 'dart:async';

import 'package:mason_logger/mason_logger.dart';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../localisation.dart';
import '../utils/config_mixin.dart';
import '../utils/console_mixin.dart';
import '../utils/mason_mixin.dart';

///
class ListCommand extends BrandCommand<void> with ConfigMixin, ConsoleMixin, MasonMixin {
  ListCommand() : super(Localisation.listCommandName, Localisation.listCommandDescription);

  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    final progress = logger.progress('Listing...', options: const ProgressOptions());

    final list = await getBricks();
    progress.cancel();
    logInfo('\nAvailable templates\n');
    for (final template in list) {
      final index = list.indexOf(template);
      logInfo(' ${index + 1}. ${template.asChoice}');
    }
  }
}
