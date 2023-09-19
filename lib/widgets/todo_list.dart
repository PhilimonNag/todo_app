import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/filtered_todos/filtered_todos_cubit.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';

import '../models/todo.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodosCubit, FilteredTodosState>(
      builder: (context, state) {
        return ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: state.filteredTodos.length,
            separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 1,
                ),
            itemBuilder: (context, index) =>
                TodoItem(todo: state.filteredTodos[index]));
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          value: todo.complete,
          onChanged: (value) {
            context.read<TodoListCubit>().toggleTodo(todo.id);
          }),
      title: Text(todo.desc),
    );
  }
}
