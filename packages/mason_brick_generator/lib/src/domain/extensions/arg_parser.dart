import 'package:args/args.dart';

import '../../l.dart';

extension Options on ArgParser {
  void addTemplateOption() {
    // ignore: unnecessary_this
    this.addOption(L.templateKey, abbr: 't', help: L.templateHelp);
  }

  void addCleanFlag() {
    addFlag(
      L.initCleanCommandName,
      abbr: 'c',
      help: L.initCleanCommandDescription,
    );
  }
}
