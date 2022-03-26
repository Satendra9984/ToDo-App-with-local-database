import 'package:flutter/material.dart';
import 'package:todo_app/modals/moor_database.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TaskDao>(
      create: (_) => AppDatabase().taskDao,
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
