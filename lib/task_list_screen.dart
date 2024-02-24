import 'package:flutter/material.dart';
import 'package:task_app/add_task_screen.dart';
import 'package:task_app/task.dart';
import 'package:task_app/task_count_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> _taskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Lists",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TaskCountScreen(count: _taskList.length),
                ),
              );
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Task? data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
          if (data != null) {
            setState(() {
              _taskList.add(data);
            });
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      body: SafeArea(
        child: _taskList.isNotEmpty
            ? ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _taskList[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    subtitle: Text(
                      _taskList[index].description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                    trailing: _taskList[index].isCompleted
                        ? const Icon(Icons.add_task_rounded)
                        : const Icon(Icons.cancel),
                  );
                },
                itemCount: _taskList.length)
            : const Center(
                child: Text("No tasks to display"),
              ),
      ),
    );
  }
}
