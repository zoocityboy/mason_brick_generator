import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import '../../../domain/repositories/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_list_state.dart';

class {{name.pascalCase()}}ListCubit extends Cubit<{{name.pascalCase()}}ListState> {
  {{name.pascalCase()}}ListCubit(this.repository) : super(const {{name.pascalCase()}}ListInitialState());
  final I{{name.pascalCase()}}Repository repository;
  final CancelToken cancelToken = CancelToken();

  Future<void> get() async {
    emit(const {{name.pascalCase()}}ListLoadingState());
    final response = await repository.getList(token: cancelToken);
    response.tryResult(
      (l) => emit({{name.pascalCase()}}ListFailureState(l)),
      (r) => emit({{name.pascalCase()}}ListLoadedState(r)),
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
