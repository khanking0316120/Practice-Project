import 'package:flutter/material.dart';
import 'package:practice/sign-in-screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 6, 234),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.cached_sharp, color: Colors.white, size: 40),
                    SizedBox(width: 10),
                    Text(
                      "LOGO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Create Your\nNew Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Join smart and secure app made for you",
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text("Full Name"),
                      SizedBox(height: 5),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          hintText: "Enter Your Full Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 15),

                      Text("Email"),
                      SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          String email = value.trim().toLowerCase();
                          final bool emailValid = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(email);

                          if (!emailValid) {
                            return "Invalid format! Please use a proper email format";
                          }
                          if (!email.endsWith('@gmail.com')) {
                            return "Please check the spelling. It must end with '@gmail.com'";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          hintText: "Enter Your Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(height: 15),

                      Text("Phone Number"),
                      SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your phone number";
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return "Phone number must contain only digits";
                          }
                          if (value.length < 10 || value.length > 15) {
                            return "Enter a valid phone number (10-15 digits)";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          hintText: "Enter Your Phone Number",
                          prefixIcon: Icon(Icons.call),
                        ),
                      ),
                      SizedBox(height: 15),

                      Text("Password"),
                      SizedBox(height: 5),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.length < 8) {
                            return "Must be at least 8 characters long";
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return "Must contain at least one uppercase letter";
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return "Must contain at least one lowercase letter";
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return "Must contain at least one number";
                          }
                          if (!RegExp(r'[!@#\$&*~%]').hasMatch(value)) {
                            return "Must contain at least one special character (!@#\$&*~%)";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          hintText: "Enter Your Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      SizedBox(height: 25),

                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SigninScreen(name: "Muhammad Massab"),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 19, 7, 240),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Text("  or  "),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/google.png",
                                  height: 30,
                                ),
                                SizedBox(width: 8),
                                Text("Google"),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Facebook.png",
                                  height: 30,
                                ),
                                SizedBox(width: 8),
                                Text("Facebook"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          SizedBox(width: 10),
                          Text(
                            "Sign in",
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 134, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
