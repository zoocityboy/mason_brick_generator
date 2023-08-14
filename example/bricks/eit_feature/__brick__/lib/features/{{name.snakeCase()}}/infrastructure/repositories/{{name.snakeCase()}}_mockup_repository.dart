import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

import '../../domain/entities/{{name.snakeCase()}}/isdetail_{{name.snakeCase()}}_detail_entity.dart';
import '../../domain/entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../dto/{{name.snakeCase()}}/{{name.snakeCase()}}_detail_dto.dart';
import '../dto/{{name.snakeCase()}}/{{name.snakeCase()}}_list_dto.dart';

class {{name.pascalCase()}}MockupRepository implements I{{name.pascalCase()}}Repository {
  @override
  Future<Result<ApiFailure, {{name.pascalCase()}}Entities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final result = List.generate(limit, (index) => {{name.pascalCase()}}Dto(id: index));
    final items = result.toEntities();
    return Future.value(Success(items));
  }

  @override
  Future<Result<ApiFailure, {{name.pascalCase()}}DetailEntity>> getById(int id, {CancelToken? token}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    const item = {{name.pascalCase()}}DetailDto(id: 1, name: 'Name');
    return Future.value(Success(item.toEntity()));
  }
}
