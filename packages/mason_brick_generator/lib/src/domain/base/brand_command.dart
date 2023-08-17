import 'package:args/command_runner.dart';

import '../../utils/config_mixin.dart';
import '../../utils/console_mixin.dart';
import '../../utils/mason_mixin.dart';
import '../extensions/command.dart';

/// Brand command for change style
/// of usage description
abstract class BrandCommand<T> extends Command<T> with ConsoleMixin, ConfigMixin, MasonMixin {
  BrandCommand(this.cmdName, this.cmdDescription);
  final String cmdName;
  final String cmdDescription;
  @override
  String get name => cmdName;
  @override
  String get description => cmdDescription;
  @override
  String get usage => toUsage();
}
