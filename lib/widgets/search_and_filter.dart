import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit.dart';
import '../models/todo.dart';

class TodoSearchAndFilter extends StatefulWidget {
  const TodoSearchAndFilter({super.key});

  @override
  State<TodoSearchAndFilter> createState() => _TodoSearchState();
}

class _TodoSearchState extends State<TodoSearchAndFilter> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            label: Text('Search todo...'),
          ),
          onChanged: (value) {
            if (value.trim().isNotEmpty) {
              context.read<TodoSearchCubit>().changeSearchTerm(value);
              
            }
          },
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.complete),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Complete',
        style: TextStyle(
            fontSize: 18.0,
            color: context.watch<TodoFilterCubit>().state.filter == filter
                ? Colors.purple
                : Colors.grey),
      ),
    );
  }
}
