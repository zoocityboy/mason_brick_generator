import 'dart:async';

import 'package:eit_networking/eit_networking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/{{name.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import '../../../domain/repositories/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_list_event.dart';
part '{{name.snakeCase()}}_list_state.dart';

class {{name.pascalCase()}}ListBloc extends Bloc<{{name.pascalCase()}}ListEvent, {{name.pascalCase()}}ListState> {
  {{name.pascalCase()}}ListBloc(this.repository) : super(const {{name.pascalCase()}}ListInitialState()) {
    on<Custom{{name.pascalCase()}}ListEvent>(_onCustom{{name.pascalCase()}}ListEvent);
    on<Fetch{{name.pascalCase()}}ListEvent>(_onFetch{{name.pascalCase()}}ListEvent);
  }
  final I{{name.pascalCase()}}Repository repository;
  final CancelToken cancelToken = CancelToken();

  FutureOr<void> _onCustom{{name.pascalCase()}}ListEvent(
    Custom{{name.pascalCase()}}ListEvent event,
    Emitter<{{name.pascalCase()}}ListState> emit,
  ) {
    // TODO: Add Logic
  }

  FutureOr<void> _onFetch{{name.pascalCase()}}ListEvent(
    Fetch{{name.pascalCase()}}ListEvent event,
    Emitter<{{name.pascalCase()}}ListState> emit,
  ) async {
    emit(const {{name.pascalCase()}}ListLoadingState());
    final response = await repository.getList(page: event.page, limit: event.limit, token: cancelToken);
    response.tryResult((l) => emit({{name.pascalCase()}}ListFailureState(l)), (r) => emit({{name.pascalCase()}}ListLoadedState(r)));
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
