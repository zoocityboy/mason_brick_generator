import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

import '../../domain/entities/{{name.snakeCase()}}/isdetail_{{name.snakeCase()}}_detail_entity.dart';
import '../../domain/entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}ImplRepository implements I{{name.pascalCase()}}Repository {
  @override
  Future<Result<ApiFailure, {{name.pascalCase()}}Entities>> getList({int page = 0, int limit = 20, CancelToken? token}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<ApiFailure, {{name.pascalCase()}}DetailEntity>> getById(int id, {CancelToken? token}) {
    throw UnimplementedError();
  }
}
