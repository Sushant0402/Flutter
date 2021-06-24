import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class BmiBrain{
  int height;
  int weight;
  double _bmi;
  Color color;

  BmiBrain(int height, int weight){
    this.height = height;
    this.weight = weight;
    _bmi = weight / pow(height/100, 2);
  }

  String calculateBmi(){
    return _bmi.toStringAsFixed(1); //this function convert a double to string rounding off to given number
  }

  String getResult(){
    if(_bmi > 25){
      return "OVERWEIGHT";
    }
    else if(_bmi < 18.5){
      return "UNDERWEIGHT";
    }
    else{
      return "NORMAL";
    }
  }

  String getFeedback(){
    if(_bmi > 25){
      return "You have higher than normal body weight. Try to exercise more.";
    }
    else if(_bmi < 18.5){
      return "You have lower than the normal body weight. You can eat a bit more.";
    }
    else{
      return "You have a normal body weight. Good job!";
    }
  }

  Color getColor(){
    if(_bmi > 25){
      return color = Colors.red;
    }
    else if(_bmi < 18.5){
      return color = Colors.red;
    }
    else{
      return color = Colors.green;
    }
  }
}