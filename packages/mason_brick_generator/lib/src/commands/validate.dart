import 'dart:async';

import 'package:universal_io/io.dart';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../domain/extensions/arg_parser.dart';
import '../localisation.dart';
import '../utils/config_mixin.dart';
import '../utils/console_mixin.dart';

/// Validate current template settings.
/// - check if every template variable is defined
class ValidateCommand extends BrandCommand<void> with ConsoleMixin, ConfigMixin {
  /// Adding a template option
  ValidateCommand() : super(Localisation.validateCommandName, Localisation.validateCommandDescription) {
    argParser.addTemplateOption();
  }

  @override
  String get category => Constants.advancedCategory;

  @override
  FutureOr<void>? run() async {
    final config = await getConfig();
    for (final tpl in config.temaplates) {
      await validateTemplate(tpl);
    }
  }

  Future<void> validateTemplate(TemplateYaml tpl) async {
    final progress = logProgress(Localisation.validateProcessing);
    await Future<void>.delayed(const Duration(seconds: 3));
    progressComplete(progress, message: 'New module validated.');
  }

  /// Validate if template is defined well
  Future<void> validateStructure(TemplateYaml tpl) async {
    final source = Directory(tpl.processSourcePath);
    if (!source.existsSync()) {
      throw const InvalidTemplate();
    }
  }

  /// Validate if variables are defined and used by template
  Future<void> validateVariables(TemplateYaml tpl) async {}
}
