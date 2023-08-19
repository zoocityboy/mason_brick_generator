// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

import '../../constants.dart';
import '../extensions/string.dart';
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
    this.source = '/',
    this.files = const [],
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
  @JsonKey(defaultValue: '/')
  final String source;

  final List<String> files;

  /// Map of variable properties used when templating a brick.
  @VarsConverter()
  final Map<String, BrickVariableProperties> vars;

  // @PathConverter()
  final List<ReplaceVariableProperties> replace;

  @override
  String toString() {
    return '$name - $description';
  }

  /// Used by AnyChoice for choose value
  String get asChoice => '[$name]: $description';

  /// Path definition of __brick__ root like
  /// "root/bricks/my-brick/__brick__/"
  String get brickDestinationPath => p.join(
        [
          Constants.bricksFolder,
          name,
          Constants.brickFolder,
        ].join(Platform.pathSeparator),
      );

  /// Path definition of template root
  /// "root/bricks/my-brick/"
  String get brickRootPath => [Constants.bricksFolder, name].join(Platform.pathSeparator);

  /// Path definition of __brick_source__ root like
  /// "root/bricks/my-brick/__brick_source__/"
  String get brickSourceDestinationPath => p.join(
        [
          Constants.bricksFolder,
          name,
          Constants.brickSourceFolder,
        ].join(Platform.pathSeparator),
      );

  ///
  String get brickSourceFolderPath =>
      [Constants.bricksFolder, name, Constants.brickSourceFolder, ...source.split('/')].join(Platform.pathSeparator);

  ///
  String brickSourcePath(String filePath) => [
        Constants.bricksFolder,
        name,
        Constants.brickSourceFolder,
        ...filePath.split('/'),
      ].join(Platform.pathSeparator);

  /// Convert path separators to Platform.pathSeparator
  String get appSourcePath => source.osPath;

  /// Convert path separators to Platform.pathSeparator
  String appSourceFilePath(String filePath) => filePath.osPath;

  Map<String, dynamic> varsToJson() {
    final json = <String, dynamic>{};
    vars.forEach((key, value) {
      json[key] = value.toJson();
    });
    return json;
  }
}
