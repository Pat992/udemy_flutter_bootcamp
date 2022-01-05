import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function deleteTask;
  final bool kIsWeb;

  TaskTile(
      {this.isChecked, this.taskTitle, this.checkboxCallback, this.deleteTask, this.kIsWeb});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        onLongPress: deleteTask,
        // Make checkbox leading on web or windows
        leading: kIsWeb
            ? Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: isChecked,
                onChanged: checkboxCallback,
              )
            : null,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        // Make checkbox trailing if not on web or windows
        trailing: !kIsWeb
            ? Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: isChecked,
                onChanged: checkboxCallback,
              )
            : null,
      ),
    );
  }
}
