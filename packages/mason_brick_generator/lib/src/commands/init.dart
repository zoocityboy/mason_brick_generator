import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../domain/extensions/arg_parser.dart';
import '../localisation.dart';
import '../utils/mason_mixin.dart';

///
class InitCommand extends BrandCommand<void> with MasonWorkspaceMixin {
  InitCommand() : super(Localisation.initCommandName, Localisation.initCommandDescription) {
    argParser.addCleanFlag();
  }
  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    if (argResults?.wasParsed(Localisation.initCleanCommandName) ?? false) {
      final progress = logger.progress(Localisation.initCleanProcessing);
      await desetroy();
      progress.complete(Localisation.initCleanProcessingSuccess);
    }
    await initialize();
    if (!isMasonTplInitialized()) {
      final progress = logger.progress(Localisation.initProcessingMbg);
      await makeWorkspaceFromBundle();
      progress.complete(Localisation.initProcessingMbgSuccess);
    }
  }
}
