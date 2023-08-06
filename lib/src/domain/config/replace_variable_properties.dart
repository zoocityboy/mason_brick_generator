// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:meta/meta.dart';

part 'replace_variable_properties.g.dart';

enum ReplaceVariableType {
  /// Import
  import,

  /// Content
  content,

  /// Path
  path,
}

/// This class represents a Path Definition.
@JsonSerializable()
class ReplaceVariableProperties {
  /// This class represents a Path Definition.
  @internal
  const ReplaceVariableProperties({
    required this.type,
    required this.name,
    this.value = '',
    this.prefix,
    this.suffix,
  });

  /// {@macro brick_variable_properties}
  ///
  /// Creates an instance of a [ReplaceVariableProperties]
  /// of type [ReplaceVariableProperties.content].
  const ReplaceVariableProperties.content()
      : this(
          type: ReplaceVariableType.content,
          name: 'string',
          value: '',
        );

  /// A factory method to create an instance of PathDefinition from a JSON map.
  factory ReplaceVariableProperties.fromJson(Map<String, dynamic> json) {
    return _$ReplaceVariablePropertiesFromJson(json);
  }

  /// A method to convert PathDefinition instance to a JSON map.
  Map<String, dynamic> toJson() => _$ReplaceVariablePropertiesToJson(this);

  /// The key of the path definition.
  final String name;

  final ReplaceVariableType type;

  /// The value of the path definition. It has a default value of an empty string.
  @JsonKey(defaultValue: '')
  final String value;

  /// The prefix of the line.
  /// ```dart
  /// prefix = '{{#detail}}';
  /// suffix = '{{/detail}}';
  /// {{#detail}}import '../detail.dart';{{/detail}}
  /// ```
  final String? prefix;

  /// The suffix of the line.
  /// ```dart
  /// prefix = '{{#detail}}';
  /// suffix = '{{/detail}}';
  /// {{#detail}}import '../detail.dart';{{/detail}}
  /// ```
  final String? suffix;

  @override
  String toString() {
    return 'ReplaceVariableProperties(key: $name, value: $value, prefix: $prefix, suffix: $suffix)';
  }
}

class X {
  static Logger logger = Logger();
}

/// {@template vars_converter}
/// Json Converter for [Map<String, PathProperties>].
/// {@endtemplate}
class PathConverter implements JsonConverter<Map<String, ReplaceVariableProperties>, dynamic> {
  /// {@macro vars_converter}
  const PathConverter();

  @override
  dynamic toJson(Map<String, ReplaceVariableProperties> value) {
    return value.map((key, value) => MapEntry(key, value.toJson()));
  }

  @override
  Map<String, ReplaceVariableProperties> fromJson(dynamic value) {
    final dynamic value0 = value is String ? json.decode(value) : value;
    X.logger.info('$value0');
    if (value0 is List) {
      for (final v in value0) {
        X.logger.info('$v');
      }
      return <String, ReplaceVariableProperties>{
        for (final v in value0)
          v['name'] as String: ReplaceVariableProperties.fromJson(Map<String, dynamic>.from(v as Map)),
      };
    }
    if (value0 is Map) {
      X.logger.info('$value0');
      return value0.map(
        (dynamic key, dynamic value) {
          final entry = MapEntry(
            key as String,
            ReplaceVariableProperties.fromJson({
              'key': key,
              'type': value?['type'] ?? '',
              'value': value?['value'] ?? '',
              'prefix': value?['prefix'],
              'suffix': value?['suffix'],
            }),
          );
          return entry;
        },
      );
    }
    throw const FormatException();
  }
}
