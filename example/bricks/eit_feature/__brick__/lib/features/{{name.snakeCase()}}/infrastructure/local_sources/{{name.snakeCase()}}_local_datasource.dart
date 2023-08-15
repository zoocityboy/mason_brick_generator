import 'package:eit_storage/eit_storage.dart';

import '../../domain/local_sources/{{name.snakeCase()}}_local_datasource.dart';
import '../dto/{{name.snakeCase()}}/{{name.snakeCase()}}_list_dto.dart';

// TODO: [ {{name.pascalCase()}}LocalDataSource] implement all functions and remove this line!!
class {{name.pascalCase()}}LocalDataSource implements I{{name.pascalCase()}}LocalDataSource {
  const {{name.pascalCase()}}LocalDataSource({
    required this.box,
  });
  final EitBox<{{name.pascalCase()}}Dto> box;

  @override
  Future<void> delete({{name.pascalCase()}}Dto item) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<{{name.pascalCase()}}Dto?> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<{{name.pascalCase()}}Dto>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<{{name.pascalCase()}}Dto> save({{name.pascalCase()}}Dto item) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Stream<List<{{name.pascalCase()}}Dto>> watchAllItems() {
    // TODO: implement watchAllAlbums
    throw UnimplementedError();
  }
}
