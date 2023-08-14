import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';

part '{{name.snakeCase()}}_list_dto.g.dart';

typedef {{name.pascalCase()}}Dtos = List<{{name.pascalCase()}}Entity>;

@JsonSerializable(
  explicitToJson: true,
  anyMap: true,
  createToJson: true,
)
class {{name.pascalCase()}}Dto {
  const {{name.pascalCase()}}Dto({required this.id});
  @override
  factory {{name.pascalCase()}}Dto.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}DtoFromJson(json);
  @JsonKey(defaultValue: -1)
  final int id;
  Map<String, dynamic> toJson() => _${{name.pascalCase()}}DtoToJson(this);

  /// Convert [{{name.pascalCase()}}Dto] DTO to domain [{{name.pascalCase()}}Entity] model
  {{name.pascalCase()}}Entity toEntity() {
    return {{name.pascalCase()}}Entity(id: id);
  }
}

extension {{name.pascalCase()}}DtoListX on List<{{name.pascalCase()}}Dto> {
  {{name.pascalCase()}}Entities toEntities() => map((item) => item.toEntity()).toList();
}
