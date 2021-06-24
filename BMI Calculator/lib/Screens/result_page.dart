import 'package:bmi_calculator/bmi_Brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  final BmiBrain bmi;
  ResultPage({this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style : TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text("Your Result", style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kInactiveColor
              ),
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(bmi.getResult(), style: TextStyle(
                    color: bmi.getColor(),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(bmi.calculateBmi(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text("Normal BMI Range:",style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 6,),
                  Text("18.5 - 25  kg/m2",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Text(bmi.getFeedback(),
                    style:TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: BottomButton(buttonText:"Re-Calculate",onTap: (){
                Navigator.pop(context);
              },),
          )
        ],
      )
    );
  }
}
