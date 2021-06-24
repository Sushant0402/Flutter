import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/location.dart';
import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'loading',
      routes: {
        'loading': (context) => LoadingScreen(),
        'location' : (context) => LocationScreen(),
        'city' : (context) => CityScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

/*
Stateless Widget have only one lifeCycle method build

But Stateful widget have many lifeCycle methods
  main methods are:
    initState() //called when widget is created
    build() //called when widget is updated
    deactivate() //called when widget destroys
NullAwareOperator
  x ?? y
  take x if x not null else take y
 */