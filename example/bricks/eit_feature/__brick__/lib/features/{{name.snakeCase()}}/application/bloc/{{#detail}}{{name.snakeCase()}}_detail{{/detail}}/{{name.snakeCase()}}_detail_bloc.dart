import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import '../../../domain/repositories/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_detail_event.dart';
part '{{name.snakeCase()}}_detail_state.dart';

/// [{{name.pascalCase()}}DetailBloc] will be used in [{{name.pascalCase()}}Detail] screen
class {{name.pascalCase()}}DetailBloc extends Bloc<{{name.pascalCase()}}DetailEvent, {{name.pascalCase()}}DetailState> {
  {{name.pascalCase()}}DetailBloc(this.repository) : super(const {{name.pascalCase()}}DetailInitialState()) {
    on<Custom{{name.pascalCase()}}DetailEvent>(_onCustom{{name.pascalCase()}}DetailEvent);
    on<Fetch{{name.pascalCase()}}DetailEvent>(_onFetch{{name.pascalCase()}}DetailEvent);
  }
  final I{{name.pascalCase()}}Repository repository;
  final CancelToken cancelToken = CancelToken();

  FutureOr<void> _onCustom{{name.pascalCase()}}DetailEvent(
    Custom{{name.pascalCase()}}DetailEvent event,
    Emitter<{{name.pascalCase()}}DetailState> emit,
  ) {}

  FutureOr<void> _onFetch{{name.pascalCase()}}DetailEvent(
    Fetch{{name.pascalCase()}}DetailEvent event,
    Emitter<{{name.pascalCase()}}DetailState> emit,
  ) async {
    emit(const {{name.pascalCase()}}DetailLoadingState());
    final response = await repository.getById(event.id, token: cancelToken);
    response.tryResult(
      (l) => emit({{name.pascalCase()}}DetailFailureState(l)),
      (r) => emit({{name.pascalCase()}}DetailLoadedState(r)),
    );
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
