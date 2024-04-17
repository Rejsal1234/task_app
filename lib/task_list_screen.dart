import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/add_task_screen.dart';
import 'package:task_app/provider/task_provider.dart';
import 'package:task_app/task_count_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskList = context.watch<TaskProvider>().taskList;
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
                  builder: (BuildContext context) => const TaskCountScreen(),
                ),
              );
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      body: SafeArea(
        child: taskList.isNotEmpty
            ? ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      taskList[index].title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    subtitle: Text(
                      taskList[index].description ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<TaskProvider>().completeTask(index);
                          },
                          icon: taskList[index].isCompleted
                              ? const Icon(Icons.add_task_rounded)
                              : const Icon(Icons.cancel),
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<TaskProvider>()
                                .deleteTask(taskList[index]);
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  );
                },
                itemCount: taskList.length)
            : const Center(
                child: Text("No tasks to display"),
              ),
      ),
    );
  }
}
