import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/cubit.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'ToDo',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '${context.watch<ActiveTodoCountCubit>().state.activeCount} items left',
          style: const TextStyle(fontSize: 20.0, color: Colors.red),
        ),
        // Text(
        //   '${BlocProvider.of<ActiveTodoCountCubit>(context).state.activeCount} items left',
        //   style: const TextStyle(fontSize: 20.0, color: Colors.red),
        // )
      ],
    );
  }
}
