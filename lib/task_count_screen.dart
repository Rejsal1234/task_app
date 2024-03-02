import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/provider/task_provider.dart';

class TaskCountScreen extends StatelessWidget {
  const TaskCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskList = context.watch<TaskProvider>().taskList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Count",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ),
      body: Center(
        child: Text(
          taskList.length.toString(),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 100),
        ),
      ),
    );
  }
}
