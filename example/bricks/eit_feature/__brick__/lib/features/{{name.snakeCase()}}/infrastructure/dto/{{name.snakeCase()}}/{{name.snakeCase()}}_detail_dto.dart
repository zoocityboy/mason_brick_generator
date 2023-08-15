import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/{{name.snakeCase()}}/isdetail_{{name.snakeCase()}}_detail_entity.dart';

part '{{name.snakeCase()}}_detail_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  anyMap: true,
  createToJson: true,
)
class {{name.pascalCase()}}DetailDto {
  const {{name.pascalCase()}}DetailDto({
    required this.id,
    required this.name,
  });
  factory {{name.pascalCase()}}DetailDto.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}DetailDtoFromJson(json);
  final String name;
  @JsonKey(defaultValue: -1)
  final int id;
  Map<String, dynamic> toJson() => _${{name.pascalCase()}}DetailDtoToJson(this);

  /// Convert [{{name.pascalCase()}}DetailDto] DTO to domain [{{name.pascalCase()}}DetailEntity] model
  {{name.pascalCase()}}DetailEntity toEntity() {
    return {{name.pascalCase()}}DetailEntity(
      id: id,
      name: name,
    );
  }
}
