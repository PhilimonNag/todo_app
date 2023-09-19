part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchFilter;
  const TodoSearchState({required this.searchFilter});
  factory TodoSearchState.initial() {
    return const TodoSearchState(searchFilter: '');
  }
  @override
  List<Object> get props => [searchFilter];

  TodoSearchState copyWith({
    String? searchFilter,
  }) {
    return TodoSearchState(
      searchFilter: searchFilter ?? this.searchFilter,
    );
  }
}
