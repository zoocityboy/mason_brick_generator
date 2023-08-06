part of 'tpl_feature_name_detail_bloc.dart';

sealed class TplFeatureNameDetailState extends Equatable {
  const TplFeatureNameDetailState();

  @override
  List<Object?> get props => [];
}

class TplFeatureNameDetailInitialState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailInitialState();
}

class TplFeatureNameDetailLoadingState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailLoadingState();
}

class TplFeatureNameDetailLoadedState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailLoadedState(this.data);
  final TplFeatureNameEntity data;
  @override
  List<Object?> get props => [data];
}

class TplFeatureNameDetailFailureState extends TplFeatureNameDetailState {
  const TplFeatureNameDetailFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [error];
}
