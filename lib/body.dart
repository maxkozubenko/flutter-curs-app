import 'package:flutter/material.dart';
import 'package:todo_list/pages/completed_todos.dart';
import 'package:todo_list/pages/deleted_todos.dart';
import 'package:todo_list/pages/todos.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double getSum(double a, double b) {
      return a + b;
    }

    final fontSizeTitle = getSum(10.0, 10.0);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "List",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeTitle,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        bottom: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          tabs: const [
            Tab(
              text: "Todo",
            ),
            Tab(
              text: "Completed",
            ),
            Tab(
              text: "Deleted",
            ),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          TodosPage(),
          CompletedTodosPage(),
          DeletedTodosPage(),
        ],
      ),
    );
  }
}
