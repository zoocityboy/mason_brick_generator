part of 'tpl_feature_name_detail_cubit.dart';

sealed class TplFeatureNameDetailCubitState extends Equatable {
  const TplFeatureNameDetailCubitState();
  @override
  List<Object?> get props => [];
}

class TplFeatureNameDetailCubitInitialState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitInitialState();
}

class TplFeatureNameDetailCubitLoadingState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitLoadingState();
}

class TplFeatureNameDetailCubitLoadedState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitLoadedState(this.data);
  final TplFeatureNameDetailEntity data;
  @override
  List<Object?> get props => super.props + [data];
}

class TplFeatureNameDetailCubitFailureState extends TplFeatureNameDetailCubitState {
  const TplFeatureNameDetailCubitFailureState(this.error);
  final ApiFailure? error;
  @override
  List<Object?> get props => super.props + [error];
}
