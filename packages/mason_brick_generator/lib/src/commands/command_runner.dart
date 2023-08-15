import 'package:args/command_runner.dart';

import '../localisation.dart';
import '../utils/config_mixin.dart';
import '../utils/console_mixin.dart';
import 'generate.dart';
import 'init.dart';
import 'list.dart';

/// Command Runner for Mason Brick Generator
class MasonTplCommandRunner extends CommandRunner<void> with ConsoleMixin, ConfigMixin {
  ///Create a new Command runner
  MasonTplCommandRunner() : super(Localisation.cmd, Localisation.cmdDescription) {
    addCommand(InitCommand());
    addCommand(ListCommand());
    addCommand(GenerateCommand());
  }
  @override
  String get usageFooter => Localisation.cmdFooter;
}
