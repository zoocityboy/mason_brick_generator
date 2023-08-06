import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

import '../entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import '../entities/tpl_feature_name/tpl_feature_name_entity.dart';

abstract class ITplFeatureNameRepository {
  Future<Result<ApiFailure, TplFeatureNameEntities>> getList({int page = 0, int limit = 20, CancelToken? token});
  Future<Result<ApiFailure, TplFeatureNameDetailEntity>> getById(int id, {CancelToken? token});
}
