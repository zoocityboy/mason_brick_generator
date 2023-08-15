// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_variable_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceVariableProperties _$ReplaceVariablePropertiesFromJson(Map json) =>
    $checkedCreate(
      'ReplaceVariableProperties',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['name', 'type', 'value', 'prefix', 'suffix'],
        );
        final val = ReplaceVariableProperties(
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$ReplaceVariableTypeEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String? ?? ''),
          prefix: $checkedConvert('prefix', (v) => v as String?),
          suffix: $checkedConvert('suffix', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ReplaceVariablePropertiesToJson(
    ReplaceVariableProperties instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'type': _$ReplaceVariableTypeEnumMap[instance.type]!,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  return val;
}

const _$ReplaceVariableTypeEnumMap = {
  ReplaceVariableType.import: 'import',
  ReplaceVariableType.content: 'content',
  ReplaceVariableType.path: 'path',
};
