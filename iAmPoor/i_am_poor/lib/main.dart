import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[50],
          title: Center(
            child: Text(
              'I am poor',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: Center(child: Image(image: AssetImage('images/coal.png'))
        ),
      ),
    ),
  );
}
