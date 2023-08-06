part of 'tpl_feature_name_detail_bloc.dart';

sealed class TplFeatureNameDetailEvent extends Equatable {
  const TplFeatureNameDetailEvent();
  @override
  List<Object> get props => [];
}

/// DetailEvent added when some custom logic happens
class CustomTplFeatureNameDetailEvent extends TplFeatureNameDetailEvent {
  const CustomTplFeatureNameDetailEvent();
}

class FetchTplFeatureNameDetailEvent extends TplFeatureNameDetailEvent {
  const FetchTplFeatureNameDetailEvent({this.id = -1});
  final int id;
  @override
  List<Object> get props => [id];
}
