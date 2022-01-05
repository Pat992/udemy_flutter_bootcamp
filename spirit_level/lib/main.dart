import 'package:flutter/material.dart';
import 'package:aeyrium_sensor/aeyrium_sensor.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: SpiritLevel(),
    );
  }
}

class SpiritLevel extends StatefulWidget {
  @override
  _SpiritLevelState createState() => _SpiritLevelState();
}

class _SpiritLevelState extends State<SpiritLevel> {

  String degText = '0.0';
  double degrees = 1.5;
  String btnText = 'Start';
  bool isRunning = false;

  getAxis() {
    AeyriumSensor.sensorEvents.listen((SensorEvent event) {

      if((event.roll + 1.5) > 2.9){
        setState(() {
          degrees = 3.0;
          degText = event.roll.toString();
          degText = degText.substring(0, 5);
        });

      }
      if((event.roll + 1.5) < 0){
        setState(() {
          degrees = 0.0;
          degText = event.roll.toString();
          degText = degText.substring(0, 5);
        });

      }
      else if ((event.roll + 1.5) > 0 && (event.roll + 1.5) < 3.0){
        setState(() {
          degrees = event.roll + 1.5;
          degText = event.roll.toString();
          degText = degText.substring(0, 5);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(degText,
        style: TextStyle(
          fontSize: 40.0,
        ),),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            overlayColor: Color(0x29EB1555),
            inactiveTrackColor: Color(0xFF8D8E98),
            activeTrackColor: Color(0xFF8D8E98),
            thumbColor: Colors.lightBlueAccent,
          ),
          child: Slider(
            value: degrees,
            min: 0.0,
            max: 3.0,
            onChanged: (double newValue) {
              setState(() {
                degText = newValue.toString();
              });
            },
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.blueGrey[100],
          foregroundColor: Colors.black,
          child: Text(btnText),
          onPressed: () {
            if(isRunning == false){
              setState(() {
                isRunning = true;
                btnText = 'Stop';
                getAxis();
              });
            }
            else if (isRunning == true){
              Navigator.pushNamed(context, '/');
            }
          },
        )
      ],
    );
  }
}

