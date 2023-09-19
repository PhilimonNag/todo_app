import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  late final StreamSubscription streamSubscription;
  ActiveTodoCountCubit({required this.todoListCubit})
      : super(ActiveTodoCountState.initial()) {
    streamSubscription = todoListCubit.stream.listen((TodoListState event) {
      print('todolistState : $event');
      final currentActiveTodos =
          event.todos.where((element) => !element.complete).toList().length;
      print('current todo:$currentActiveTodos');
      emit(state.copyWith(activeCount: currentActiveTodos));
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
