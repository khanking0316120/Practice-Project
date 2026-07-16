import 'package:flutter/material.dart';

class studentProfile extends StatelessWidget {
  const studentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 52, 70, 184),
        leading: BackButton(color: Colors.white),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.white),
              ),
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/images/cat.JPG"),
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Icon(
            //       Icons.account_circle,
            //       color: Colors.blue,
            //       size: 100,
            //     ),
            //   ),
            // ),
            Text(
              "Mano",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Flutter Developer"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "120",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 26, 56, 206),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Project",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Container(width: 0.5, height: 30, color: Colors.black54),
                  Column(
                    children: [
                      Text(
                        "100K",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 96, 82, 248),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                      ),
                    ],
                  ),
                  Container(width: 0.5, height: 30, color: Colors.black54),

                  Column(
                    children: [
                      Text(
                        "20",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 24, 48, 185),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "It is a long established fact \nthat a reader will be distracted by.",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.call, color: Colors.blue),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Contact information",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 12, 12, 12),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("Email"),
                        Spacer(),
                        Text("mano234@gmail.com"),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("Phone"),
                        Spacer(),
                        Text("+1 2340678"),
                      ],
                    ),

                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("location"),
                        Spacer(),
                        Text("Kohat Pakistan"),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.blue),

                        Text("SKills"),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,

                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text("Flutter"),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,

                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text("firebase"),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,

                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text("SQL"),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,

                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text("C++"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
