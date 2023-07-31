import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/body.dart';
import 'package:todo_list/theme.dart';

import 'providers/todo_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      builder: (context, child) => const TodoList(),
    ),
  );
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const DefaultTabController(
        length: 3,
        child: Body(),
      ),
    );
  }
}
