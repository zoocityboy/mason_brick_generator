import 'dart:async';

import 'package:collection/collection.dart';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../domain/config/template_yaml.dart';
import '../domain/exceptions/exceptions.dart';
import '../domain/extensions/arg_parser.dart';
import '../localisation.dart';
import '../utils/config_mixin.dart';
import '../utils/console_mixin.dart';
import '../utils/generator_mixin.dart';
import '../utils/mason_mixin.dart';

/// Select and generate current template
class GenerateCommand extends BrandCommand<void> with ConsoleMixin, ConfigMixin, MasonMixin, GeneratorMixin {
  /// Adding a template option
  GenerateCommand() : super(Localisation.generateCommandName, Localisation.generateCommandDescription) {
    argParser.addTemplateOption();
  }
  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    final tplvalue = argResults?[Localisation.templateKey];
    final templates = <TemplateYaml>[];
    final config = await getConfig();

    if (tplvalue != null) {
      final selectedTemplates = config.temaplates.firstWhereOrNull((element) => element.name == tplvalue);
      if (selectedTemplates == null) throw TemplateNotFound('$tplvalue not found.');
      templates.add(selectedTemplates);
    } else {
      final selectedTemplates = logger.chooseAny<TemplateYaml>(
        Localisation.generateChoosen,
        choices: config.temaplates,
        display: (choice) => choice.asChoice,
      );
      templates.addAll(selectedTemplates);
    }

    logger.info('selected: $templates');
    for (final tpl in templates) {
      await generateTemplate(tpl);
    }
  }
}
