import 'dart:async';

import 'package:args/command_runner.dart';

import '../constants.dart';
import '../domain/exceptions/exceptions.dart';
import '../localisation.dart';
import '../utils/check_mixin.dart';
import '../utils/console_mixin.dart';
import 'discover.dart';
import 'generate.dart';
import 'init.dart';
import 'list.dart';
import 'validate.dart';

/// Command Runner for Mason Brick Generator
class MasonTplCommandRunner extends CommandRunner<void> with CheckMixin, ConsoleMixin {
  ///
  MasonTplCommandRunner() : super(Localisation.cmd, Localisation.cmdDescription) {
    addCommand(InitCommand());
    addCommand(ListCommand());
    addCommand(GenerateCommand());

    addCommand(DiscoverCommand());
    addCommand(ValidateCommand());
  }
  @override
  String get usageFooter => Localisation.cmdFooter;

  ///
  Future<void> initialize() async {
    if (!isMasonInitialized()) {
      throw const MasonNotInitialized(
        Constants.masonConfigFileName,
      );
    }
    if (!isMasonTplInitialized()) {
      throw const MasonTplNotInitialized(
        Constants.masonTplConfigFileName,
      );
    }
    if (!isMasonTplInitialized()) {}
    // final config = await Config.loadFromPubspec();
    // logger.info('config: $config');
  }
}
