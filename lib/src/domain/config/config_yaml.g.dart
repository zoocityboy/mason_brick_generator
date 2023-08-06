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
          allowedKeys: const ['mason_tpl'],
        );
        final val = ConfigYaml(
          masonTpl: $checkedConvert(
              'mason_tpl',
              (v) => (v as List<dynamic>)
                  .map((e) => TemplateYaml.fromJson(e as Map))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'masonTpl': 'mason_tpl'},
    );

Map<String, dynamic> _$ConfigYamlToJson(ConfigYaml instance) =>
    <String, dynamic>{
      'mason_tpl': instance.masonTpl.map((e) => e.toJson()).toList(),
    };
