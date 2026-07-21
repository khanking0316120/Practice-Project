import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Logic ke liye basic variables
  String displayValue = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String history = ''; // Upar chhoti history show karne ke liye

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        // Sab kuch clear kar do
        displayValue = '0';
        num1 = 0;
        num2 = 0;
        operand = '';
        history = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '/') {
        // Jab koi operator press ho, current screen ki value save kar lo
        num1 = double.parse(displayValue);
        operand = buttonText;
        history = displayValue + ' ' + operand;
        displayValue = '0'; // Screen clear karo naye number ke liye
      } else if (buttonText == '=') {
        // Calculation ka time
        num2 = double.parse(displayValue);
        history = history + ' ' + displayValue;

        if (operand == '+') displayValue = (num1 + num2).toString();
        if (operand == '-') displayValue = (num1 - num2).toString();
        if (operand == 'x') displayValue = (num1 * num2).toString();
        if (operand == '/') displayValue = (num1 / num2).toString();

        // Agar result .0 pe khatam ho raha hai, toh usko remove kar do taake clean lage
        if (displayValue.endsWith('.0')) {
          displayValue = displayValue.substring(0, displayValue.length - 2);
        }
        operand = '';
      } else {
        // Numbers type karne ka logic
        if (displayValue == '0') {
          displayValue = buttonText; // Initial 0 ko replace karo
        } else {
          displayValue =
              displayValue + buttonText; // Digits ko jorte jao (append)
        }
      }
    });
  }

  // Reusable Button Widget taake UI ka code chhota rahe
  Widget customButton(String text, Color textColor, Color bgColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded modern buttons
            ),
            padding: EdgeInsets.all(24.0),
            backgroundColor: bgColor,
            elevation: 0, // Flat premium look
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 28.0,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Colors define kar rahay hain
    Color darkBg = Color(0xFF1E1E2C);
    Color keypadBg = Color(0xFF2D2D44);
    Color neonCyan = Color(0xFF00FFCB);

    return Scaffold(
      backgroundColor: darkBg,
      body: Column(
        children: <Widget>[
          // Screen Area (Display)
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30.0),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    history,
                    style: TextStyle(fontSize: 24.0, color: Colors.white54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    displayValue,
                    style: TextStyle(
                      fontSize: 64.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Keypad Area
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: keypadBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    customButton('7', Colors.white, darkBg),
                    customButton('8', Colors.white, darkBg),
                    customButton('9', Colors.white, darkBg),
                    customButton('/', neonCyan, darkBg),
                  ],
                ),
                Row(
                  children: [
                    customButton('4', Colors.white, darkBg),
                    customButton('5', Colors.white, darkBg),
                    customButton('6', Colors.white, darkBg),
                    customButton('x', neonCyan, darkBg),
                  ],
                ),
                Row(
                  children: [
                    customButton('1', Colors.white, darkBg),
                    customButton('2', Colors.white, darkBg),
                    customButton('3', Colors.white, darkBg),
                    customButton('-', neonCyan, darkBg),
                  ],
                ),
                Row(
                  children: [
                    customButton(
                      'AC',
                      darkBg,
                      neonCyan,
                    ), // Clear button alag color mein
                    customButton('0', Colors.white, darkBg),
                    customButton(
                      '=',
                      darkBg,
                      neonCyan,
                    ), // Equal button prominent
                    customButton('+', neonCyan, darkBg),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
