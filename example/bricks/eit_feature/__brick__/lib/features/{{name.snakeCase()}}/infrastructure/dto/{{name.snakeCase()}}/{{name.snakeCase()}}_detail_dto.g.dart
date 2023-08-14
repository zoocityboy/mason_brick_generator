// GENERATED CODE - DO NOT MODIFY BY HAND

part of '{{name.snakeCase()}}_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

{{name.pascalCase()}}DetailDto _${{name.pascalCase()}}DetailDtoFromJson(Map json) =>
    $checkedCreate(
      '{{name.pascalCase()}}DetailDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['name', 'id'],
        );
        final val = {{name.pascalCase()}}DetailDto(
          id: $checkedConvert('id', (v) => v as int? ?? -1),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _${{name.pascalCase()}}DetailDtoToJson(
        {{name.pascalCase()}}DetailDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
