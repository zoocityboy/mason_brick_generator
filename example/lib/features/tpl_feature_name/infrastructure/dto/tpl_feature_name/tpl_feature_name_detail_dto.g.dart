// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_feature_name_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFeatureNameDetailDto _$TplFeatureNameDetailDtoFromJson(Map json) =>
    $checkedCreate(
      'TplFeatureNameDetailDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['name', 'id'],
        );
        final val = TplFeatureNameDetailDto(
          id: $checkedConvert('id', (v) => v as int? ?? -1),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplFeatureNameDetailDtoToJson(
        TplFeatureNameDetailDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
