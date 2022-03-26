import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom_widget/tasks_list.dart';
import '../modals/moor_database.dart' show Task, TaskDao;
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  // Future<int> getCount(BuildContext context) async {
  //   int count = await Provider.of<TaskDao>(context).watchAllTasks().length;
  //   return count;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'TodoEy',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 51,
                    color: Colors.white,
                  ),
                ),
                StreamBuilder(
                  stream: Provider.of<TaskDao>(context).watchAllTasks(),
                  builder: (context, AsyncSnapshot<List<Task>> snapshot) {
                    return Text(
                      '${snapshot.data?.length} tasks',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(44),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          showModalBottomSheet(
            // isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTask(
                    // addTask: addTask,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
