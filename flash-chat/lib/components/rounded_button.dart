import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton({this.backgroundColor, this.btnText, this.btnFunction});

  final Color backgroundColor;
  final String btnText;
  final Function btnFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: btnFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btnText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}