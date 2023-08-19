import 'package:args/command_runner.dart';

import '../l.dart';
import '../mixins/config_mixin.dart';
import '../mixins/console_mixin.dart';
import 'generate.dart';
import 'init.dart';
import 'list.dart';
import 'validate.dart';

/// Command Runner for Mason Brick Generator
class MasonTplCommandRunner extends CommandRunner<void> with ConsoleMixin, ConfigMixin {
  ///Create a new Command runner
  MasonTplCommandRunner() : super(L.cmd, L.cmdDescription) {
    addCommand(InitCommand());
    addCommand(ListCommand());
    addCommand(GenerateCommand());
    addCommand(ValidateCommand());
  }
  @override
  String get usageFooter => L.cmdFooter;
}
