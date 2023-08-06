// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

import '../../constants.dart';
import 'brick_yaml.dart';
import 'replace_variable_properties.dart';

part 'template_yaml.g.dart';

////
@JsonSerializable()
class TemplateYaml {
  ////
  TemplateYaml({
    required this.name,
    required this.description,
    required this.source,
    this.replace = const [],
    this.vars = const <String, BrickVariableProperties>{},
  });

  /// Converts [Map] to [TemplateYaml]
  factory TemplateYaml.fromJson(Map<dynamic, dynamic> json) => _$TemplateYamlFromJson(json);

  /// Converts [TemplateYaml] to [Map]
  Map<dynamic, dynamic> toJson() => _$TemplateYamlToJson(this);

  /// Name of the brick.
  @JsonKey(name: 'template')
  final String name;

  /// Description of the brick.
  final String description;

  /// Version of the brick (semver).
  final String source;

  /// Map of variable properties used when templating a brick.
  @VarsConverter()
  final Map<String, BrickVariableProperties> vars;

  // @PathConverter()
  final List<ReplaceVariableProperties> replace;

  @override
  String toString() {
    return '$name - $description';
  }

  String get asChoice => '[$name] $description';
  String get processTargetRootPath => p.join(
        [
          Constants.bricksFolder,
          name,
          Constants.brickFolder,
        ].join(Platform.pathSeparator),
      );
  String get processTagetPath =>
      p.join([Constants.bricksFolder, name, Constants.brickFolder, ...source.split('/')].join(Platform.pathSeparator));
  String get processSourcePath => source.replaceAll('/', Platform.pathSeparator);
}
