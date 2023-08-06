part of 'tpl_feature_name_list_bloc.dart';

sealed class TplFeatureNameListState extends Equatable {
  const TplFeatureNameListState();

  @override
  List<Object?> get props => [];
  static TplFeatureNameListState onFailure(ApiFailure error) => TplFeatureNameListFailureState(error);

  static TplFeatureNameListState onSuccess(List<TplFeatureNameEntity> data) => TplFeatureNameListLoadedState(data);
}

class TplFeatureNameListInitialState extends TplFeatureNameListState {
  const TplFeatureNameListInitialState();
}

class TplFeatureNameListLoadingState extends TplFeatureNameListState {
  const TplFeatureNameListLoadingState();
}

class TplFeatureNameListLoadedState extends TplFeatureNameListState {
  const TplFeatureNameListLoadedState(this.data);
  final List<TplFeatureNameEntity> data;
  @override
  List<Object?> get props => [data];
}

class TplFeatureNameListFailureState extends TplFeatureNameListState {
  const TplFeatureNameListFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [error];
}
