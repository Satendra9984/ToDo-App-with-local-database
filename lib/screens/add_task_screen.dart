import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import '../modals/moor_database.dart' show TaskDao, TasksCompanion;

class AddTask extends StatelessWidget {
  // final Function addTask;
  AddTask({
    Key? key,
  }) : super(key: key);

  String? title;
  bool? isCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(),
              onChanged: (value) {
                title = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (title != null) {
                  Provider.of<TaskDao>(context, listen: false).insertTask(
                    TasksCompanion(
                      isChecked: const Value(false),
                      desc: Value(title!),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
