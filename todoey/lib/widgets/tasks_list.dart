import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/platform_data.dart';
import 'package:todoey/providers/task_data.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    // use Consumer so as to not having to write "Provider.of<TaskData>(context).tasks[...]..." on all single tasks
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                  checkboxCallback: (val) => taskData.toggleTask(val, index),
                  taskTitle: taskData.tasks[index].name,
                  deleteTask: () => taskData.deleteTask(taskData.tasks[index]),
                  kIsWeb: Provider.of<PlatformData>(context).kIsWeb,
                  isChecked: taskData.tasks[index].isDone);
            },
            itemCount: taskData.taskCount);
      },
    );
  }
}
