import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {
  TodoSearchCubit() : super(TodoSearchState.initial());
  void changeSearchTerm(String searchTerm) {
    emit(state.copyWith(searchFilter: searchTerm));
  }
}
