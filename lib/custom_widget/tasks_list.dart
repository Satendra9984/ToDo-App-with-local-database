import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/moor_database.dart';
import 'tasks_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // F getCount(){
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: dao.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data;

        if (tasks != null) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TasksTile(
                isChecked: tasks[index].isChecked,
                title: tasks[index].desc,
                longPressCallBack: () async => await dao.deleteTask(
                  TasksCompanion(
                    id: Value(tasks[index].id),
                    isChecked: Value(tasks[index].isChecked),
                    desc: Value(tasks[index].desc),
                  ),
                ),
                toggleIsCheckedState: () async {
                  await dao.updateTask(
                    TasksCompanion(
                      id: Value(tasks[index].id),
                      isChecked: Value(!tasks[index].isChecked),
                      desc: Value(tasks[index].desc),
                    ),
                  );
                },
              );
            },
            itemCount: tasks.length,
          );
        }
        return const Text('No tasks');
      },
    );
  }
}
