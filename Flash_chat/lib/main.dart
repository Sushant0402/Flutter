import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id, //here we used class to get it's property called id which contain a string
        //and we will provide that as route
        //id property is a static property because we need id property throughout the app, and making a object every time
        //to get id will be very memory consuming so we make it static - means it is initialized only once and can be used anywhere
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id : (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id : (context) => ChatScreen(),
        }
    );
  }
}
