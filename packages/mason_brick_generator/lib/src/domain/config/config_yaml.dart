import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:universal_io/io.dart';

import '../../constants.dart';
import '../exceptions/exceptions.dart';
import 'template_yaml.dart';

part 'config_yaml.g.dart';

///
@JsonSerializable()
class ConfigYaml {
  ///
  ConfigYaml({
    required this.masonTpl,
  });

  /// Converts [Map] to [ConfigYaml]
  factory ConfigYaml.fromJson(Map<dynamic, dynamic> json) => _$ConfigYamlFromJson(json);

  /// Converts [ConfigYaml] to [Map]
  Map<dynamic, dynamic> toJson() => _$ConfigYamlToJson(this);

  /// Converts [Map] to [ConfigYaml]
  @JsonKey(name: Constants.masonTplKey)
  List<TemplateYaml> masonTpl;

  List<TemplateYaml> get temaplates => masonTpl;

  ///
  static Future<ConfigYaml> loadFromPubspec() async {
    /// Check if pubspec.yaml exists
    final configFile = File(Constants.masonTplConfigFileName);
    if (!configFile.existsSync()) throw const MasonTplConfigFileNotFound();

    // /// Load the pubspec file
    // final pubspec = await configFile.readAsString();
    // final yaml = loadYaml(pubspec) as YamlMap;

    // /// Check if mason_brick_generator key exists
    // if (!yaml.containsKey(Constants.masonTplKey)) {
    //   throw const TemplateNotFound();
    // }

    // if (yaml[Constants.masonTplKey] is! YamlList) {
    //   throw const InvalidTemplate();
    // }
    final configYaml = checkedYamlDecode(
      configFile.readAsStringSync(),
      (m) => ConfigYaml.fromJson(m!),
    );

    return configYaml;
  }
}
