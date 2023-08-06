import 'package:args/args.dart';

import '../../constants.dart';
import '../../localisation.dart';
import '../config/template_yaml.dart';

extension ArgResultValues on ArgResults {
  TemplateYaml? getTemplateFromArgResults(List<TemplateYaml> templates) {
    final value = this[Localisation.templateKey];
    return null;
  }
}
