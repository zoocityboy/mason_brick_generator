import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../localisation.dart';

/// Check source code and suggest new templates
class DiscoverCommand extends BrandCommand<void> {
  DiscoverCommand() : super(Localisation.discoverCommandName, Localisation.discoverCommandDescription);

  @override
  String get category => Constants.advancedCategory;

  @override
  FutureOr<void>? run() async {
    final progress = logProgress(Localisation.disocoverProcessing);
    await Future<void>.delayed(const Duration(seconds: 3));

    progressComplete(progress, message: Localisation.discoverNotFoundNew);
  }
}
