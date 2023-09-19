import 'package:flutter/material.dart';
import 'package:todo_app/widgets/create_todo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/widgets/search_and_filter.dart';

import '../widgets/todo_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
            child: Column(children: [
              TodoHeader(),
              SizedBox(
                height: 12.0,
              ),
              CreateTodo(),
              SizedBox(
                height: 12.0,
              ),
              TodoSearchAndFilter(),

              ListTodo(),
            ]),
          ),
        ),
      ),
    );
  }
}
