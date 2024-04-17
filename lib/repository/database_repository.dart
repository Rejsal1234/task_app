import 'package:task_app/helper/database_helper.dart';
import 'package:task_app/task.dart';

abstract class IDatabaseRepository {
  /// To insert a new task
  Future<void> insertTask(Task task);

  /// fetch all tasks
  Future<List<Task>?> getTasks();

  /// update the task
  Future<void> updateTask(Task task);

  /// Delete a task
  Future<void> deleteTask(num id);
}

class DatabaseRepository implements IDatabaseRepository {
  DatabaseRepository(this.databaseHelper);

  DatabaseHelper databaseHelper;

  @override
  Future<void> deleteTask(num id) async {
    final db = await databaseHelper.database;
    if (db != null) {
      await db.delete('Task', where: 'id = ?', whereArgs: [id]);
    }
  }

  @override
  Future<List<Task>?> getTasks() async {
    final db = await databaseHelper.database;
    if (db == null) {
      return null;
    }
    List<Map> maps = await db.query('Task');
    if (maps.isNotEmpty) {
      List<Task> tasks = [];
      for (final element in maps) {
        tasks.add(Task.fromJson(element));
      }
      return tasks;
    }
    return null;
  }

  @override
  Future<void> insertTask(Task task) async {
    final db = await databaseHelper.database;
    if (db != null) {
      await db.insert('Task', task.toJson());
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    final db = await databaseHelper.database;
    if (db == null) {
      return;
    }
    await db
        .update('Task', task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }
}
