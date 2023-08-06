// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brick_yaml.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrickVariableProperties _$BrickVariablePropertiesFromJson(Map json) =>
    $checkedCreate(
      'BrickVariableProperties',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'type',
            'description',
            'default',
            'defaults',
            'prompt',
            'values',
            'separator'
          ],
        );
        final val = BrickVariableProperties(
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$BrickVariableTypeEnumMap, v)),
          description: $checkedConvert('description', (v) => v as String?),
          defaultValue: $checkedConvert('default', (v) => v),
          defaultValues: $checkedConvert('defaults', (v) => v),
          prompt: $checkedConvert('prompt', (v) => v as String?),
          values: $checkedConvert('values',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          separator: $checkedConvert('separator', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'defaultValue': 'default',
        'defaultValues': 'defaults'
      },
    );

Map<String, dynamic> _$BrickVariablePropertiesToJson(
    BrickVariableProperties instance) {
  final val = <String, dynamic>{
    'type': _$BrickVariableTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('default', instance.defaultValue);
  writeNotNull('defaults', instance.defaultValues);
  writeNotNull('prompt', instance.prompt);
  writeNotNull('values', instance.values);
  writeNotNull('separator', instance.separator);
  return val;
}

const _$BrickVariableTypeEnumMap = {
  BrickVariableType.array: 'array',
  BrickVariableType.number: 'number',
  BrickVariableType.string: 'string',
  BrickVariableType.boolean: 'boolean',
  BrickVariableType.enumeration: 'enum',
  BrickVariableType.list: 'list',
};

BrickEnvironment _$BrickEnvironmentFromJson(Map json) => $checkedCreate(
      'BrickEnvironment',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['mason'],
        );
        final val = BrickEnvironment(
          mason: $checkedConvert('mason', (v) => v as String? ?? 'any'),
        );
        return val;
      },
    );

Map<String, dynamic> _$BrickEnvironmentToJson(BrickEnvironment instance) =>
    <String, dynamic>{
      'mason': instance.mason,
    };
