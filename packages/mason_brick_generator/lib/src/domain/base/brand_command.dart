import 'package:args/command_runner.dart';

import '../extensions/command.dart';

/// Brand command for change style
/// of usage description
abstract class BrandCommand<T> extends Command<T> {
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
