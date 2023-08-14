part of '{{name.snakeCase()}}_detail_bloc.dart';

sealed class {{name.pascalCase()}}DetailEvent extends Equatable {
  const {{name.pascalCase()}}DetailEvent();
  @override
  List<Object> get props => [];
}

/// DetailEvent added when some custom logic happens
class Custom{{name.pascalCase()}}DetailEvent extends {{name.pascalCase()}}DetailEvent {
  const Custom{{name.pascalCase()}}DetailEvent();
}

class Fetch{{name.pascalCase()}}DetailEvent extends {{name.pascalCase()}}DetailEvent {
  const Fetch{{name.pascalCase()}}DetailEvent({this.id = -1});
  final int id;
  @override
  List<Object> get props => [id];
}
