import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: TextField(
                  decoration: kTextfieldInputDecoration,
                  onChanged: (value){ //whenever the text field is changed this method will be called
                    cityName = value;
                  },
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 70,width: 250),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName); //when we are popping the current context we can return something
                    //as map, list , value etc.
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}