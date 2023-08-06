import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tpl_feature_name/tpl_feature_name_entity.dart';
import '../../../domain/repositories/tpl_feature_name_repository.dart';

part 'tpl_feature_name_list_event.dart';
part 'tpl_feature_name_list_state.dart';

class TplFeatureNameListBloc extends Bloc<TplFeatureNameListEvent, TplFeatureNameListState> {
  TplFeatureNameListBloc(this.repository) : super(const TplFeatureNameListInitialState()) {
    on<CustomTplFeatureNameListEvent>(_onCustomTplFeatureNameListEvent);
    on<FetchTplFeatureNameListEvent>(_onFetchTplFeatureNameListEvent);
  }
  final ITplFeatureNameRepository repository;
  final CancelToken cancelToken = CancelToken();

  FutureOr<void> _onCustomTplFeatureNameListEvent(
    CustomTplFeatureNameListEvent event,
    Emitter<TplFeatureNameListState> emit,
  ) {
    // TODO: Add Logic
  }

  FutureOr<void> _onFetchTplFeatureNameListEvent(
    FetchTplFeatureNameListEvent event,
    Emitter<TplFeatureNameListState> emit,
  ) async {
    emit(const TplFeatureNameListLoadingState());
    final response = await repository.getList(page: event.page, limit: event.limit, token: cancelToken);
    response.tryResult((l) => emit(TplFeatureNameListFailureState(l)), (r) => emit(TplFeatureNameListLoadedState(r)));
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
