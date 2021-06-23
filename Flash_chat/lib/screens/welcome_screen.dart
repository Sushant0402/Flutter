import 'login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static String id="welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin { //extending our welcome screen state with Ticker
  //Ticker provide a ticking feature like ticking of a clock, and it is called 60 times per second
  //for single widget animation we use SingleTicker and for multiple we use simply Ticker

  late AnimationController controller; //This is need to control the animation
  late Animation animation; //Animation class provide different types of animation which we can use.
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3 )); // vsync need Ticker so we provide it this, because our class is a ticker now.
    //we can provide AnimationController many things, but vsync is required

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate,);
    animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(controller); // we can use many twin animation checkout flutter docs.
                //whenever you use Tween animation make sure in controller you have upperBound set to 1, other wise animation will not work.


    // controller.forward();
    controller.forward();
    // int i=0;

    // controller.addStatusListener((status) {
        //running animation infinitely.
    //   if(controller.status == AnimationStatus.completed){
    //     controller.reverse(from: 60); //
    //   }
    //   else if(controller.status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });


    controller.addListener(() {
      //this call back function will be called repeatedly till the animation ends.
      setState(() {}); //and we are calling setState to see the changes that this controller is changing on every ticking.
      // i++;
      // print("$i  ${controller.value}");
      // print(animation.value);
    });
    Firebase.initializeApp(); //before using the firebase we have to initialize the app
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose(); //when you use infinite animation you should dispose animation if you are moving to another page
    //because it will be running continuously and will be costing much resources.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,//use . after color to see what properties you can use with color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(//Hero widget is used to provide animation to an widget
                  //we just need to provide a tag- and tag should be same around pages if tag don't match animation don't take place
                  tag:'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent, title: "Log In", onPress: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(color: Colors.blue, title: "Register", onPress: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
          ],
        ),
      ),
    );
  }
}



/*
 mixins are way to reuse a class code in multiple class hierarchies

 like duck, example with CanFly and CanSwim

 if is like an addon Feature for a class.

 */
