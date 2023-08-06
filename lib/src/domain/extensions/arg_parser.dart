import 'package:args/args.dart';

import '../../constants.dart';
import '../../localisation.dart';

extension Options on ArgParser {
  void addTemplateOption() {
    // ignore: unnecessary_this
    this.addOption(Localisation.templateKey, abbr: 't', help: Localisation.templateHelp);
  }
}
