import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_detail_event.dart';
part 'tpl_feature_name_detail_state.dart';

class TplFeatureNameDetailBloc extends Bloc<TplFeatureNameDetailEvent, TplFeatureNameDetailState> {
  TplFeatureNameDetailBloc(this.repository) : super(const TplFeatureNameDetailInitialState()) {
    on<CustomTplFeatureNameDetailEvent>(_onCustomTplFeatureNameDetailEvent);
    on<FetchTplFeatureNameDetailEvent>(_onFetchTplFeatureNameDetailEvent);
  }
  final ITplFeatureNameRepository repository;
  final CancelToken cancelToken = CancelToken();

  FutureOr<void> _onCustomTplFeatureNameDetailEvent(
    CustomTplFeatureNameDetailEvent event,
    Emitter<TplFeatureNameDetailState> emit,
  ) {
    // TODO: Add Logic
  }

  FutureOr<void> _onFetchTplFeatureNameDetailEvent(
    FetchTplFeatureNameDetailEvent event,
    Emitter<TplFeatureNameDetailState> emit,
  ) async {
    emit(const TplFeatureNameDetailLoadingState());
    final response = await repository.getById(event.id, token: cancelToken);
    response.tryResult(
      (l) => emit(TplFeatureNameDetailFailureState(l)),
      (r) => emit(TplFeatureNameDetailLoadedState(r)),
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
