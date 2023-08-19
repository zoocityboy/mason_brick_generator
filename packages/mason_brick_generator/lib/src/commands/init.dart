import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../domain/extensions/arg_parser.dart';
import '../l.dart';
import '../mixins/mason_mixin.dart';

///
class InitCommand extends BrandCommand<void> with MasonWorkspaceMixin {
  InitCommand() : super(L.initCommandName, L.initCommandDescription) {
    argParser.addCleanFlag();
  }
  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    if (argResults?.wasParsed(L.initCleanCommandName) ?? false) {
      final progress = logger.progress(L.initCleanProcessing);
      await desetroy();
      progress.complete(L.initCleanProcessingSuccess);
    }
    await initialize();
    if (!isMasonTplInitialized()) {
      final progress = logger.progress(L.initProcessingMbg);
      await makeWorkspaceFromBundle();
      progress.complete(L.initProcessingMbgSuccess);
    }
  }
}
