import 'package:flutter/material.dart';
import 'package:task_app/repository/database_repository.dart';
import 'package:task_app/task.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider(this._databaseRepository) {
    getTasks();
  }

  final IDatabaseRepository _databaseRepository;
  List<Task> _taskList = [];

  List<Task> get taskList => _taskList;

  Future<void> getTasks() async {
    final data = await _databaseRepository.getTasks();
    if (data != null) {
      _taskList = data;
      notifyListeners();
    }
  }

  Future<void> addTask(Task task) async {
    await _databaseRepository.insertTask(task);
    _taskList.add(task);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    if (task.id != null) {
      await _databaseRepository.deleteTask(task.id!);
    }
    _taskList.remove(task);
    notifyListeners();
  }

  Future<void> completeTask(int index) async {
    _taskList[index].isCompleted = !_taskList[index].isCompleted;
    await _databaseRepository.updateTask(_taskList[index]);
    notifyListeners();
  }
}
