part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Jesus is my teacher'),
      Todo(id: '2', desc: 'Jesus is my father')
    ]);
  }
  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
