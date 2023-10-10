import 'dart:math';

import 'package:flutter/material.dart';

const String kTitle = "Title";
const String kBody = "Body";
const String kSave = "Save";
const String kHintTextTitle = "Enter Title";
const String kHintTextBody = "Enter Body";
 Color kBackGroundButton =  AppStyle.mainColor;
Color kButtonMain=const Color.fromARGB(255, 75, 227, 154);


Widget myWidgetIcon (context) => IconButton(
onPressed: (){
  Navigator.pop(context);
}, icon: Icon(Icons.arrow_back_ios,
color: AppStyle.cardsColor[AppStyle.color],),);

class AppStyle{
  
    static Color mainColor = const Color(0xff000633);
    static  int color = Random().nextInt(AppStyle.cardsColor.length);    
    static List<Color> cardsColor=[
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
    Colors.purple.shade200,
    Colors.amber.shade200,
    Colors.grey.shade300,
    Colors.brown.shade200,
    Colors.cyan.shade200,
    Colors.indigo.shade200,
    Colors.lime.shade300,
    Colors.teal.shade300,
  ];

}