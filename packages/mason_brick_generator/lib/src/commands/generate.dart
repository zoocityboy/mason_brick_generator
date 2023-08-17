import 'dart:async';

import '../constants.dart';
import '../domain/base/brand_command.dart';
import '../domain/config/template_yaml.dart';
import '../domain/extensions/arg_parser.dart';
import '../domain/extensions/arg_results.dart';
import '../localisation.dart';
import '../utils/generator_mixin.dart';
import '../utils/mason_mixin.dart';

/// Select and generate current template
class GenerateCommand extends BrandCommand<void> with MasonBrickMixin, MasonWorkspaceMixin, GeneratorMixin {
  /// Adding a template option
  GenerateCommand() : super(Localisation.generateCommandName, Localisation.generateCommandDescription) {
    argParser.addTemplateOption();
  }
  @override
  String get category => Constants.basicCategory;

  @override
  FutureOr<void>? run() async {
    final config = await getConfig();
    final value = argResults?.getTemplateFromArgResults(config.temaplates) ?? (name: null, template: null);
    final templates = <TemplateYaml>[];
    if (value.name != null) {
      if (value.template == null) {
        logWarning('\nSelected template ${value.name} not found.\nPlease select from available templates.');
        final selectedTemplates = await chooseTemplates(config.temaplates);
        templates.addAll(selectedTemplates);
      } else {
        templates.add(value.template!);
      }
    } else {
      final selectedTemplates = await chooseTemplates(config.temaplates);
      templates.addAll(selectedTemplates);
    }

    return generate(templates);
  }

  /// Select from available templates
  Future<List<TemplateYaml>> chooseTemplates(List<TemplateYaml> templates) async {
    final selectedTemplates = logger.chooseAny<TemplateYaml>(
      Localisation.generateChoosen,
      choices: templates,
      display: (choice) => choice.asChoice,
    );
    return selectedTemplates;
  }

  /// Generate selected templates
  Future<void> generate(List<TemplateYaml> templates) async {
    for (final tpl in templates) {
      await generateTemplate(tpl);
    }
  }
}
