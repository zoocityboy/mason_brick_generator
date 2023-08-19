import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../l.dart';

/// Check source code and suggest new templates
class DiscoverCommand extends BrandCommand<void> {
  DiscoverCommand() : super(L.discoverCommandName, L.discoverCommandDescription);

  @override
  String get category => Constants.advancedCategory;

  @override
  FutureOr<void>? run() async {
    final progress = logProgress(L.disocoverProcessing);
    await Future<void>.delayed(const Duration(seconds: 3));

    progressComplete(progress, message: L.discoverNotFoundNew);
  }
}
