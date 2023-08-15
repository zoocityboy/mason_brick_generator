import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../localisation.dart';
import '../utils/config_mixin.dart';
import '../utils/console_mixin.dart';
import '../utils/mason_mixin.dart';

///
class InitCommand extends BrandCommand<void> with ConfigMixin, ConsoleMixin, MasonMixin {
  InitCommand() : super(Localisation.initCommandName, Localisation.initCommandDescription);
  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    final data = await getBricks();

    ///
    logInfo(data.toString());
  }
}
