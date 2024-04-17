import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/helper/database_helper.dart';
import 'package:task_app/provider/task_provider.dart';
import 'package:task_app/repository/database_repository.dart';
import 'package:task_app/task_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(
            DatabaseRepository(
              DatabaseHelper(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}
