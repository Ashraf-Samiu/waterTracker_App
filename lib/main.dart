/*
1- Round Tap button adds a new glass
2- list of consumed glass
3- consume- no of glass of water and time
4- show list
 */

import 'package:flutter/material.dart';
import 'package:watertracker_app/home_screen.dart';


void main(){
  runApp(const WaterTrackerApp());
}
class WaterTrackerApp extends StatelessWidget{
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}