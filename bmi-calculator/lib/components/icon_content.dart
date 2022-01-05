import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/constants.dart';


class TopCardWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  TopCardWidget({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
