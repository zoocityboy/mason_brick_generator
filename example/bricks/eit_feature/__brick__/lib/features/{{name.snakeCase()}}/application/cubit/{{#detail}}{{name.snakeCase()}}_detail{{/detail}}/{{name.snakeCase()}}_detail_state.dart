part of '{{name.snakeCase()}}_detail_cubit.dart';

sealed class {{name.pascalCase()}}DetailCubitState extends Equatable {
  const {{name.pascalCase()}}DetailCubitState();
  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}DetailCubitInitialState extends {{name.pascalCase()}}DetailCubitState {
  const {{name.pascalCase()}}DetailCubitInitialState();
}

class {{name.pascalCase()}}DetailCubitLoadingState extends {{name.pascalCase()}}DetailCubitState {
  const {{name.pascalCase()}}DetailCubitLoadingState();
}

class {{name.pascalCase()}}DetailCubitLoadedState extends {{name.pascalCase()}}DetailCubitState {
  const {{name.pascalCase()}}DetailCubitLoadedState(this.data);
  final {{name.pascalCase()}}DetailEntity data;
  @override
  List<Object?> get props => super.props + [data];
}

class {{name.pascalCase()}}DetailCubitFailureState extends {{name.pascalCase()}}DetailCubitState {
  const {{name.pascalCase()}}DetailCubitFailureState(this.error);
  final ApiFailure? error;
  @override
  List<Object?> get props => super.props + [error];
}
