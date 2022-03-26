import 'package:flutter/material.dart';
import 'task.dart';

class Data with ChangeNotifier {
  List<Task> taskList = [
    Task(title: 'buy milk', isChecked: false),
    Task(title: 'buy pencil', isChecked: false),
    Task(title: 'complete Veridocs', isChecked: false),
    Task(title: 'learn flutter', isChecked: false),
  ];

  void addTaskProvider(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  void changeIsOpen(int index, bool newValue) {
    taskList[index].isChecked = newValue;
    notifyListeners();
  }

  void deleteTask(int index) {
    taskList.remove(taskList[index]);
    notifyListeners();
  }
}
