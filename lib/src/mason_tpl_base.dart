import 'dart:convert';

import 'domain/config/config_yaml.dart';
import 'utils/check_mixin.dart';
import 'utils/console_mixin.dart';

/// Checks if you are awesome. Spoiler: you are.
class MasonTpl with CheckMixin, ConsoleMixin {
  MasonTpl._(this.config);
  final ConfigYaml config;
  Future<MasonTpl> initialize() async {
    if (!isMasonInitialized()) {}
    final config = await ConfigYaml.loadFromPubspec();

    logInfo(jsonEncode(config.masonTpl));
    return MasonTpl._(config);
  }
}
