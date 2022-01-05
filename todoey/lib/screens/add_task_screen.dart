import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTask;

  AddTaskScreen(this.addTask);

  @override
  Widget build(BuildContext context) {
    String newTitle;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (val) => newTitle = val,
          ),
          FlatButton(
            onPressed: () => addTask(newTitle),
            color: Colors.lightBlueAccent,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
