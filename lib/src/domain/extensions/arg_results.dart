import 'package:args/args.dart';
import 'package:collection/collection.dart';

import '../../localisation.dart';
import '../config/template_yaml.dart';

extension ArgResultValues on ArgResults {
  ({String? name, TemplateYaml? template}) getTemplateFromArgResults(List<TemplateYaml> templates) {
    final parsed = wasParsed(Localisation.templateKey);
    if (parsed) {
      final name = this[Localisation.templateKey] as String;
      return (name: name, template: templates.firstWhereOrNull((element) => element.name == name));
    }
    return (name: null, template: null);
  }
}
