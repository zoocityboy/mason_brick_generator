import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:eit_result/eit_result.dart';

import '../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import '../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../domain/repositories/tpl_feature_name_repository.dart';
import '../dto/tpl_feature_name/tpl_feature_name_detail_dto.dart';
import '../dto/tpl_feature_name/tpl_feature_name_list_dto.dart';

class TplFeatureNameMockupRepository implements ITplFeatureNameRepository {
  @override
  Future<Result<ApiFailure, TplFeatureNameEntities>> getList({
    int page = 0,
    int limit = 20,
    CancelToken? token,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final result = List.generate(limit, (index) => TplFeatureNameDto(id: index));
    final items = result.toEntities();
    return Future.value(Success(items));
  }

  @override
  Future<Result<ApiFailure, TplFeatureNameDetailEntity>> getById(int id, {CancelToken? token}) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    const item = TplFeatureNameDetailDto(id: 1, name: 'Name');
    return Future.value(Success(item.toEntity()));
  }
}
