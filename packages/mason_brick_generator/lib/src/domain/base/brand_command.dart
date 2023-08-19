import 'package:args/command_runner.dart';

import '../../mixins/config_mixin.dart';
import '../../mixins/console_mixin.dart';
import '../../mixins/mason_mixin.dart';
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
