import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonText;

  BottomButton({@required this.buttonText,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.only(bottom: 10),
        color: kButtonColor,
        height: 80,
        width: double.infinity,
        child: Center(child: Text(buttonText ,style: TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),)),
      ),
    );
  }
}