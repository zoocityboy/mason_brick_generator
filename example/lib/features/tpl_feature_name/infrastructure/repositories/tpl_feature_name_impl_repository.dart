import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

import '../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import '../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../domain/repositories/tpl_feature_name_repository.dart';

class TplFeatureNameImplRepository implements ITplFeatureNameRepository {
  @override
  Future<Result<ApiFailure, TplFeatureNameEntities>> getList({int page = 0, int limit = 20, CancelToken? token}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<ApiFailure, TplFeatureNameDetailEntity>> getById(int id, {CancelToken? token}) {
    throw UnimplementedError();
  }
}
