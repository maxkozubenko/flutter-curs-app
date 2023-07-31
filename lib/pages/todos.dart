import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/add_todo_modal_bottom_sheet.dart';
import 'package:todo_list/components/todo_tile.dart';
import 'package:todo_list/providers/todo_provider.dart';

import '../models/todo.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    final provider = Provider.of<TodoProvider>(context);
    List<Todo> todos = provider.allTodos
        .where(
          (element) => !element.isComplete && !element.toBeDeleted,
        )
        .toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF557744),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => Wrap(
            children: const [
              AddTaskModalBottomSheet(),
            ],
          ),
        ),
        child: const Icon(
          LineIcons.plus,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Visibility(
                visible: todos.isNotEmpty,
                replacement: const Center(
                  child: Text(
                    "You have no tasks",
                    style: TextStyle(letterSpacing: 0.1),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index) => TodoTile(
                    todo: todos[index],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
