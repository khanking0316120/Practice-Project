import 'package:flutter/material.dart';
import 'package:practice/Sign-up-screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreen();
  }

  SplashScreen() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 6, 234),

      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/google.png"),
        ),
      ),
    );
  }
}
