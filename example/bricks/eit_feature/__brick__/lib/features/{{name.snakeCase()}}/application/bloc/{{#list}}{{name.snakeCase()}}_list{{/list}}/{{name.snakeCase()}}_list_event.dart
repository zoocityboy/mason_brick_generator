part of '{{name.snakeCase()}}_list_bloc.dart';

abstract class {{name.pascalCase()}}ListEvent extends Equatable {
  const {{name.pascalCase()}}ListEvent();
  @override
  List<Object> get props => [];
}

/// Event added when some custom logic happens
class Custom{{name.pascalCase()}}ListEvent extends {{name.pascalCase()}}ListEvent {
  const Custom{{name.pascalCase()}}ListEvent();
}

class Fetch{{name.pascalCase()}}ListEvent extends {{name.pascalCase()}}ListEvent {
  const Fetch{{name.pascalCase()}}ListEvent({this.page = 0, this.limit = 20});
  final int page;
  final int limit;
  @override
  List<Object> get props => [page, limit];
}
