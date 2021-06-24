import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPress;
  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    bool isPressed = true;
    return RawMaterialButton(
      onPressed: onPress,
      onLongPress: (){

      },
      shape: CircleBorder(),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 60,
        width: 60,
      ),
      child: Icon(icon, color: Colors.white,),
    );
  }
}