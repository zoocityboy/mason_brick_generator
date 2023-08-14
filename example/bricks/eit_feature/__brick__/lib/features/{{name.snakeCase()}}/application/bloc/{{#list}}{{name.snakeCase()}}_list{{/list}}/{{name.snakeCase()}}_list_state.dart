part of '{{name.snakeCase()}}_list_bloc.dart';

sealed class {{name.pascalCase()}}ListState extends Equatable {
  const {{name.pascalCase()}}ListState();

  @override
  List<Object?> get props => [];
  static {{name.pascalCase()}}ListState onFailure(ApiFailure error) => {{name.pascalCase()}}ListFailureState(error);

  static {{name.pascalCase()}}ListState onSuccess(List<{{name.pascalCase()}}Entity> data) => {{name.pascalCase()}}ListLoadedState(data);
}

class {{name.pascalCase()}}ListInitialState extends {{name.pascalCase()}}ListState {
  const {{name.pascalCase()}}ListInitialState();
}

class {{name.pascalCase()}}ListLoadingState extends {{name.pascalCase()}}ListState {
  const {{name.pascalCase()}}ListLoadingState();
}

class {{name.pascalCase()}}ListLoadedState extends {{name.pascalCase()}}ListState {
  const {{name.pascalCase()}}ListLoadedState(this.data);
  final List<{{name.pascalCase()}}Entity> data;
  @override
  List<Object?> get props => [data];
}

class {{name.pascalCase()}}ListFailureState extends {{name.pascalCase()}}ListState {
  const {{name.pascalCase()}}ListFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [error];
}
