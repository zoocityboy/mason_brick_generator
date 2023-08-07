import 'package:args/command_runner.dart';

import '../localisation.dart';
import '../utils/config_mixin.dart';
import '../utils/console_mixin.dart';
import 'discover.dart';
import 'generate.dart';
import 'init.dart';
import 'list.dart';
import 'validate.dart';

/// Command Runner for Mason Brick Generator
class MasonTplCommandRunner extends CommandRunner<void> with ConsoleMixin, ConfigMixin {
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
}
