import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(buttonTitle,
          style: kLargeButtonText,
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}