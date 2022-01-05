import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumberLeft = 1;
  int diceNumberRight = 1;
  Random rand = new Random();

  void setDice(){
    setState(() {
      diceNumberLeft = rand.nextInt(6) + 1;
      diceNumberRight = rand.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: setDice,
              child: Image.asset('images/dice$diceNumberLeft.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: setDice,
              child: Image.asset('images/dice$diceNumberRight.png'),
            ),
          ),
        ],
      ),
    );
  }
}
