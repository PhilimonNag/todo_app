import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app/cubits/todo_search/todo_search_cubit.dart';

import '../../models/todo.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final TodoFilterCubit todoFilterCubit;
  final TodoListCubit todoListCubit;
  final TodoSearchCubit todoSearchCubit;
  late final StreamSubscription todofilterSuscription;
  late final StreamSubscription todoListSuscription;
  late final StreamSubscription todoSearchSuscription;
  FilteredTodosCubit(
      {required this.todoFilterCubit,
      required this.todoListCubit,
      required this.todoSearchCubit})
      : super(FilteredTodosState.initial()) {
    todoListSuscription =
        todoListCubit.stream.listen((event) => setFilteredTodos());
    todoSearchSuscription =
        todoSearchCubit.stream.listen((event) => setFilteredTodos());
    todofilterSuscription =
        todoFilterCubit.stream.listen((event) => setFilteredTodos());
  }
  void setFilteredTodos() {
    List<Todo> _filteredTodoList;
    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filteredTodoList = todoListCubit.state.todos
            .where((element) => !element.complete)
            .toList();
        break;
      case Filter.complete:
        _filteredTodoList = todoListCubit.state.todos
            .where((element) => element.complete)
            .toList();
        break;
      case Filter.all:
      default:
        _filteredTodoList = todoListCubit.state.todos;
    }
    if (todoSearchCubit.state.searchFilter.isNotEmpty) {
      _filteredTodoList = _filteredTodoList
          .where((element) => element.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchFilter.toLowerCase()))
          .toList();
    }
    emit(state.copyWith(filteredTodos: _filteredTodoList));
  }

  @override
  Future<void> close() {
    todoListSuscription.cancel();
    todoSearchSuscription.cancel();
    todoListSuscription.cancel();
    return super.close();
  }
}
