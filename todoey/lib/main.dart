import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/platform_data.dart';
import 'package:todoey/providers/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskData()),
        ChangeNotifierProvider(create: (_) => PlatformData())
      ],
      child: MaterialApp(
        home: TasksScreen(),
        debugShowMaterialGrid: false,
      ),
    );
  }
}
