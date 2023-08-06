import 'package:eit_storage/eit_storage.dart';

import '../../domain/local_sources/tpl_feature_name_local_datasource.dart';
import '../dto/tpl_feature_name/tpl_feature_name_list_dto.dart';

// TODO: [ TplFeatureNameLocalDataSource] implement all functions and remove this line!!
class TplFeatureNameLocalDataSource implements ITplFeatureNameLocalDataSource {
  const TplFeatureNameLocalDataSource({
    required this.box,
  });
  final EitBox<TplFeatureNameDto> box;

  @override
  Future<void> delete(TplFeatureNameDto item) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<TplFeatureNameDto?> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<List<TplFeatureNameDto>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<TplFeatureNameDto> save(TplFeatureNameDto item) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Stream<List<TplFeatureNameDto>> watchAllItems() {
    // TODO: implement watchAllAlbums
    throw UnimplementedError();
  }
}
