import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tpl_feature_name/isdetail_tpl_feature_name_detail_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_detail_state.dart';

class TplFeatureNameDetailCubit extends Cubit<TplFeatureNameDetailCubitState> {
  TplFeatureNameDetailCubit(this.repository) : super(const TplFeatureNameDetailCubitInitialState());
  final ITplFeatureNameRepository repository;
  final CancelToken cancelToken = CancelToken();

  Future<void> get() async {
    emit(const TplFeatureNameDetailCubitLoadingState());
    final response = await repository.getById(1, token: cancelToken);
    response.tryResult(
      (l) => emit(TplFeatureNameDetailCubitFailureState(l)),
      (r) => emit(TplFeatureNameDetailCubitLoadedState(r)),
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
