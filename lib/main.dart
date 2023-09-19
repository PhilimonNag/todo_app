import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/cubit.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoListCubit()),
        BlocProvider(create: (context) => TodoFilterCubit()),
        BlocProvider(create: (context) => TodoSearchCubit()),
        BlocProvider(
            create: (context) => ActiveTodoCountCubit(
                todoListCubit: BlocProvider.of<TodoListCubit>(context))),
        BlocProvider(
            create: (context) => FilteredTodosCubit(
                todoFilterCubit: context.read<TodoFilterCubit>(),
                todoListCubit: context.read<TodoListCubit>(),
                todoSearchCubit: context.read<TodoSearchCubit>()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
