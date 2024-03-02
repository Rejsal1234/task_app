import 'package:flutter/material.dart';
import 'package:task_app/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _taskList = [];

  List<Task> get taskList => _taskList;

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  void completeTask(int index) {
    _taskList[index].isCompleted = !_taskList[index].isCompleted;
    notifyListeners();
  }
}
