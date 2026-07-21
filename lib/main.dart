import 'package:flutter/material.dart';
import 'package:practice/Calculator.dart';
import 'package:practice/Home-Screen.dart';
import 'package:practice/Setting.dart';
import 'package:practice/Sign-up-screen.dart';
import 'package:practice/Splash-scree.dart';
import 'package:practice/Stack_screen.dart';
import 'package:practice/bottomnavbar_Screen.dart';
import 'package:practice/counteapp.dart';
import 'package:practice/sign-in-screen.dart';

void main() {
  // 1. Run MyApp which contains the MaterialApp structure
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      // 2. Fixed syntax: added 'ColorScheme' before '.fromSeed'
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // 3. Set Studentprofile as the home screen
      home: CalculatorScreen(),
    );
  }
}
