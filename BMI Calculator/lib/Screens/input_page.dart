import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/icon_content.dart';
import '../Components/constants.dart';
import 'result_page.dart';
import '../Components/bottom_button.dart';
import '../Components/round_button.dart';
import 'package:bmi_calculator/bmi_Brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR', style : TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ))),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard( //This is ReusableCard Constructor
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kMaleActiveColor : kInactiveColor,
                    cardChild: IconContent( //This is IconContent Class constructor
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female  ? kFemaleActiveColor: kInactiveColor,
                    cardChild: IconContent(
                      label: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("HEIGHT", style: kLabelTextStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,   //when we want to align items according to their baseline
                    //so we have to give some reference and that can be done using textBaseline property, here wo chosen alphabetic because
                    //we are working with text
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text("cm", style: kLabelTextStyle,)
                    ],
                  ),
                  SliderTheme( //we can wrap slider with a widget known as SliderTheme which can be used to customize slide
                    data: SliderTheme.of(context).copyWith( //here we don't want to put all properties of slider theme
                    //so we can copy all the data that we don't want to change from current build Context (line : 24) of app and
                    //provide only that properties data that we want to change
                      inactiveTrackColor: Colors.white24,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x16EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider( //This widget is used to make slider
                      value: height.toDouble(), //value accepts a double value
                      min: 120,
                      max: 220,
                      onChanged: (double newValue){ //so onChanged pass a value according to movement of slider
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: kLabelTextStyle,),
                          SizedBox(height: 5,),
                          Text(weight.toString(), style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      if(weight > 10){
                                        weight--;
                                      }
                                    });
                                  }
                              ),

                              SizedBox(width: 10,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    if(weight < 500){
                                      weight++;
                                    }
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour:kInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: kLabelTextStyle,),
                          SizedBox(height: 5,),
                          Text(age.toString(), style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      if(age > 1){
                                        age--;
                                      }
                                    });
                                  }
                              ),

                              SizedBox(width: 10,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    if(age < 150){
                                      age++;
                                    }
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(buttonText:"Calculate",onTap: (){
              BmiBrain bmi = BmiBrain(height, weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return ResultPage(bmi: bmi);
                  })
              );
          },)
        ],
      ),
    );
  }
}



/*
 Enum is used to create a data type that can be used across program
 */