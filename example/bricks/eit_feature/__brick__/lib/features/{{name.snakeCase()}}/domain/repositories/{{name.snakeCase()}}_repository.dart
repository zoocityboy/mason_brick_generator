import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

import '../entities/{{name.snakeCase()}}/isdetail_{{name.snakeCase()}}_detail_entity.dart';
import '../entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';

abstract class I{{name.pascalCase()}}Repository {
  Future<Result<ApiFailure, {{name.pascalCase()}}Entities>> getList({int page = 0, int limit = 20, CancelToken? token});
  Future<Result<ApiFailure, {{name.pascalCase()}}DetailEntity>> getById(int id, {CancelToken? token});
}
