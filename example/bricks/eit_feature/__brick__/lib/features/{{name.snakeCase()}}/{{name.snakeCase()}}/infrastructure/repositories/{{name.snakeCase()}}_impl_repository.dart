import '';
import '';

import '';
import '';
import '';

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
