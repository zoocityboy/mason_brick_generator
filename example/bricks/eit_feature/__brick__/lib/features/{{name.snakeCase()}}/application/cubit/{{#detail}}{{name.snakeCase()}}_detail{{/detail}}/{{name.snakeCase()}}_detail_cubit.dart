import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/{{name.snakeCase()}}/isdetail_{{name.snakeCase()}}_detail_entity.dart';
import '../../../domain/repositories/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_detail_state.dart';

class {{name.pascalCase()}}DetailCubit extends Cubit<{{name.pascalCase()}}DetailCubitState> {
  {{name.pascalCase()}}DetailCubit(this.repository) : super(const {{name.pascalCase()}}DetailCubitInitialState());
  final I{{name.pascalCase()}}Repository repository;
  final CancelToken cancelToken = CancelToken();

  Future<void> get() async {
    emit(const {{name.pascalCase()}}DetailCubitLoadingState());
    final response = await repository.getById(1, token: cancelToken);
    response.tryResult(
      (l) => emit({{name.pascalCase()}}DetailCubitFailureState(l)),
      (r) => emit({{name.pascalCase()}}DetailCubitLoadedState(r)),
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
