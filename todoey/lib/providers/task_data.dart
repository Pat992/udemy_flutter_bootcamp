import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Test'),
    Task(name: 'Test1'),
    Task(name: 'Test2'),
    Task(name: 'Repeat'),
  ];

  int get taskCount => tasks.length;

  // Add a new Task
  void addTask(String name) {
    tasks.add(Task(name: name));
    // Necessary to tell all listeners about the added task.
    notifyListeners();
  }

  void toggleTask(bool val, int index) {
    tasks[index].isDone = val;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
