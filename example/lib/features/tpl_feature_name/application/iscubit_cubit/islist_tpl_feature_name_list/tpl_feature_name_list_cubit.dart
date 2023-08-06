import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_list_state.dart';

class TplFeatureNameListCubit extends Cubit<TplFeatureNameListState> {
  TplFeatureNameListCubit(this.repository) : super(const TplFeatureNameListInitialState());
  final ITplFeatureNameRepository repository;
  final CancelToken cancelToken = CancelToken();

  Future<void> get() async {
    emit(const TplFeatureNameListLoadingState());
    final response = await repository.getList(token: cancelToken);
    response.tryResult(
      (l) => emit(TplFeatureNameListFailureState(l)),
      (r) => emit(TplFeatureNameListLoadedState(r)),
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
