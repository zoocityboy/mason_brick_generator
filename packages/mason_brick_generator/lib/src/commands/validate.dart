import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../domain/extensions/arg_parser.dart';
import '../localisation.dart';
import '../utils/validate_mixin.dart';

/// Validate current template settings.
/// - check if every template variable is defined
class ValidateCommand extends BrandCommand<void> with ValidateMixin {
  /// Adding a template option
  ValidateCommand() : super(Localisation.validateCommandName, Localisation.validateCommandDescription) {
    argParser.addTemplateOption();
  }

  @override
  String get category => Constants.advancedCategory;

  @override
  FutureOr<void>? run() async {
    await validate();
  }
}
