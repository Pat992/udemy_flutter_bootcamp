import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNr) {
    final player = AudioCache();
    player.play('note' + soundNr.toString() + '.wav');
  }

  Expanded buildKey(int nrButton) {
    var myColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.lightGreen,
      Colors.teal,
      Colors.blue,
      Colors.deepPurple
    ];

    return Expanded(
      child: FlatButton(
        onPressed: () => playSound(nrButton + 1),
        color: myColors[nrButton],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(0),
                buildKey(1),
                buildKey(2),
                buildKey(3),
                buildKey(4),
                buildKey(5),
                buildKey(6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
