import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  //Now as we have extracted this widget and use it every where it can be considered as custom widget
  //and can be customized doing all sort of things

  final Color colour; //making a variable of Color type
  //now when we make a class which extend StatelessWidget it means that the state of the widget can't be change or it is immutable so
  //all the properties of that class is final means can't be change so we have to use final with it's properties like final colour.
  //immutable means it's property should not change after some point of time, so we should make properties final.
  //now how can we update an immutable widget - we can't so, we destroy that widget and put a new widget in place of that widget which have update properties
  final Widget cardChild;

  final Function onPress; //we can also store function in a variable and it's type will be Function ,

  //#important when we make a variable final we must initialize it though constructor

  ReusableCard({@required this.colour, this.cardChild, this.onPress}); //this is constructor of Reusable card and can be used to initialized value of some property that can be used to customize thi widget
  //when we use {} it means named parameter other wise it's normal parameter
  //when we use named parameter -  then when we make object of this class we have to pass parameter with it's name like (age : 20, height :10)
  //now when we use @required annotation then then parameter is required


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

/*
  Difference between final and const is that const can't be initialized after compile time while final can;

  //you can extract a widget into a separate class from flutter outline // you can enable flutter outline by ctrl+clicking on that widget
 */