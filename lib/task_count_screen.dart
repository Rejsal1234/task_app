import 'package:flutter/material.dart';

class TaskCountScreen extends StatelessWidget {
  const TaskCountScreen({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Count",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 100),
        ),
      ),
    );
  }
}
