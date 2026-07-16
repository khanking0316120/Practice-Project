import 'package:flutter/material.dart';
import 'package:practice/Sign-up-screen.dart';

class SigninScreen extends StatefulWidget {
  final String name;
  SigninScreen({required this.name});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 21, 6, 234),
      ),
      backgroundColor: Color.fromARGB(255, 21, 6, 234),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.cached_sharp, color: Colors.white, size: 40),
                    SizedBox(width: 10),
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in to continue your journey with us",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
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
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text("Email"),
                    SizedBox(height: 5),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }

                        // Email ko lowercase (chote huroof) mein convert kar rahe hain
                        // taake agar user "Gmail.com" likhe toh wo bhi theek se check ho jaye
                        String email = value.trim().toLowerCase();

                        // 1. Pehle basic email format check karega
                        final bool emailValid = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(email);

                        if (!emailValid) {
                          return "Invalid format! Please use a proper email format";
                        }

                        // 2. Gmail ki exact spelling check karega
                        // Agar aakhir mein exactly '@gmail.com' nahi hoga, toh warning dega
                        if (!email.endsWith('@gmail.com')) {
                          return "Please check the spelling. It must end with '@gmail.com'";
                        }

                        return null; // Jab spelling aur format dono theek honge tabhi login allow hoga
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        hintText: "Enter Your Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Password"),
                    SizedBox(width: 20),
                    TextFormField(
                      obscureText:
                          true, // Yeh password ko hide karne ke liye zaroori hai (***)
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        // 1. Minimum 8 characters
                        if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        }

                        // 2. At least one uppercase letter
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return "Password must contain at least one uppercase letter (A-Z)";
                        }
                        // 3. At least one lowercase letter
                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return "Password must contain at least one lowercase letter (a-z)";
                        }
                        // 4. At least one number
                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return "Password must contain at least one number (0-9)";
                        }
                        // 5. At least one special character
                        if (!RegExp(r'[!@#\$&*~%]').hasMatch(value)) {
                          return "Password must contain at least one special character (!@#\$&*~%)";
                        }
                        return null; // Agar sari conditions meet ho jayein toh null return karega (valid)
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        hintText: "**********",
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Enter correct Password")),
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
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
                        Text("Don't have an account?"),
                        SizedBox(width: 5),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 5, 134, 255),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
