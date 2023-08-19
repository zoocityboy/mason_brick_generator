// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_yaml.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigYaml _$ConfigYamlFromJson(Map json) => $checkedCreate(
      'ConfigYaml',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['mason_brick_generator'],
        );
        final val = ConfigYaml(
          masonTpl: $checkedConvert(
              'mason_brick_generator',
              (v) => (v as List<dynamic>)
                  .map((e) => TemplateYaml.fromJson(e as Map))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'masonTpl': 'mason_brick_generator'},
    );

Map<String, dynamic> _$ConfigYamlToJson(ConfigYaml instance) =>
    <String, dynamic>{
      'mason_brick_generator':
          instance.masonTpl.map((e) => e.toJson()).toList(),
    };
