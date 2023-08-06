import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';

part 'tpl_feature_name_detail_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  anyMap: true,
  createToJson: true,
)
class TplFeatureNameDetailDto {
  const TplFeatureNameDetailDto({
    required this.id,
    required this.name,
  });
  factory TplFeatureNameDetailDto.fromJson(Map<String, dynamic> json) => _$TplFeatureNameDetailDtoFromJson(json);
  final String name;
  @JsonKey(defaultValue: -1)
  final int id;
  Map<String, dynamic> toJson() => _$TplFeatureNameDetailDtoToJson(this);

  /// Convert [TplFeatureNameDetailDto] DTO to domain [TplFeatureNameDetailEntity] model
  TplFeatureNameDetailEntity toEntity() {
    return TplFeatureNameDetailEntity(
      id: id,
      name: name,
    );
  }
}
