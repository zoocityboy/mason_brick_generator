import '';
import '';
import '';

import '';
import '';

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
