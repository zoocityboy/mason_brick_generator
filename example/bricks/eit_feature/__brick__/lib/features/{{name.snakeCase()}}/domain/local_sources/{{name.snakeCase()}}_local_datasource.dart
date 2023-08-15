import 'package:eit_storage/eit_storage.dart';

import '../../infrastructure/dto/{{name.snakeCase()}}/{{name.snakeCase()}}_list_dto.dart';

/// Stores and retrieves [{{name.pascalCase()}}Dto] in/from local storage.
///
/// The implementation uses [EitStorage] database.
abstract class I{{name.pascalCase()}}LocalDataSource {
  /// Get list of all stored [{{name.pascalCase()}}Dto]
  Future<List<{{name.pascalCase()}}Dto>> getAll();

  /// Find [{{name.pascalCase()}}Dto] item by id
  Future<{{name.pascalCase()}}Dto?> findById(String id);

  /// Save [{{name.pascalCase()}}Dto] to local storage
  Future<{{name.pascalCase()}}Dto> save({{name.pascalCase()}}Dto item);

  /// Delete concrete [{{name.pascalCase()}}Dto]
  Future<void> delete({{name.pascalCase()}}Dto item);

  /// Delete all stored items
  Future<void> deleteAll();

  /// Returns a stream of list of [{{name.pascalCase()}}Dto] stored in local storage.
  ///
  /// A new event will be emitted whenever an [{{name.pascalCase()}}Dto] is updated, removed,
  /// or a new [{{name.pascalCase()}}Dto] is stored.
  Stream<List<{{name.pascalCase()}}Dto>> watchAllItems();
}
