import '';
import '';

import '';
import '';

abstract class I{{name.pascalCase()}}Repository {
  Future<Result<ApiFailure, {{name.pascalCase()}}Entities>> getList({int page = 0, int limit = 20, CancelToken? token});
  Future<Result<ApiFailure, {{name.pascalCase()}}DetailEntity>> getById(int id, {CancelToken? token});
}
