part of '{{name.snakeCase()}}_detail_bloc.dart';

sealed class {{name.pascalCase()}}DetailState extends Equatable {
  const {{name.pascalCase()}}DetailState();

  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}DetailInitialState extends {{name.pascalCase()}}DetailState {
  const {{name.pascalCase()}}DetailInitialState();
}

class {{name.pascalCase()}}DetailLoadingState extends {{name.pascalCase()}}DetailState {
  const {{name.pascalCase()}}DetailLoadingState();
}

class {{name.pascalCase()}}DetailLoadedState extends {{name.pascalCase()}}DetailState {
  const {{name.pascalCase()}}DetailLoadedState(this.data);
  final {{name.pascalCase()}}Entity data;
  @override
  List<Object?> get props => [data];
}

class {{name.pascalCase()}}DetailFailureState extends {{name.pascalCase()}}DetailState {
  const {{name.pascalCase()}}DetailFailureState(this.error);
  final ApiFailure error;
  @override
  List<Object?> get props => [error];
}
