// GENERATED CODE - DO NOT MODIFY BY HAND

part of '{{name.snakeCase()}}_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

{{name.pascalCase()}}Dto _${{name.pascalCase()}}DtoFromJson(Map json) => {{name.pascalCase()}}Dto(
      id: json['id'] as int? ?? -1,
    );

Map<String, dynamic> _${{name.pascalCase()}}DtoToJson({{name.pascalCase()}}Dto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
