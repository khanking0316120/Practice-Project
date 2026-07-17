import 'package:flutter/material.dart';
import 'package:practice/Stack_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  List<Map<String, String>> studentList = [
    {"studentName": "Massab ", "qualification": "Flutter Developer"},
    {"studentName": "Ali Khan", "qualification": "Software Engineer"},
    {"studentName": "Ahmed Raza", "qualification": "Computer Science Graduate"},
    {"studentName": "Usman Tariq", "qualification": "Mobile App Developer"},
    {"studentName": "Hassan Ali", "qualification": "Web Developer"},
    {"studentName": "Bilal Ahmed", "qualification": "UI/UX Designer"},
    {"studentName": "Awais Khan", "qualification": "Backend Developer"},
    {"studentName": "Zain Abbas", "qualification": "Frontend Developer"},
    {"studentName": "Hamza Shah", "qualification": "Database Administrator"},
    {"studentName": "Saad Malik", "qualification": "Cyber Security Student"},
    {"studentName": "Talha Aslam", "qualification": "AI Engineer"},
    {"studentName": "Fahad Iqbal", "qualification": "Data Analyst"},
    {"studentName": "Imran Ahmed", "qualification": "Network Engineer"},
    {"studentName": "Shahzaib Khan", "qualification": "Cloud Engineer"},
    {"studentName": "Danish Ali", "qualification": "DevOps Engineer"},
    {"studentName": "Waqas Ahmed", "qualification": "Full Stack Developer"},
    {"studentName": "Asad Raza", "qualification": "Machine Learning Student"},
    {"studentName": "Kamran Malik", "qualification": "Software Tester"},
    {"studentName": "Noman Ali", "qualification": "Android Developer"},
    {
      "studentName": "Farhan Khan",
      "qualification": "Computer Engineering Student",
    },
  ];

  // Logout confirmation dialog function
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Dialog close karne ke liye
              },
              child: const Text("NO"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Dialog close karein
                Navigator.pop(context); // Drawer bhi close karein
                // Aap yahan apni logout logic add kar sakte hain
              },
              child: const Text("YES"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Setting Screen"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person, size: 35),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "User Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              // Home Menu Item
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 15,
                ),
                leading: const Icon(Icons.home, color: Colors.blue),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Profile Menu Item
              ListTile(
                leading: const Icon(Icons.account_circle, color: Colors.blue),
                title: const Text("Profile"),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 15,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Settings Menu Item
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.blue),
                title: const Text("Settings"),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 15,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              // Logout Menu Item
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(studentList[index]["studentName"]!),
                          subtitle: Text(studentList[index]["qualification"]!),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      );
                    },
                  ),
                ),
                // Alert Dialog Trigger Button
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Alert Dialog"),
                          content: const Text("This is an alert dialog"),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("NO"),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("YES"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 7, 240),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Show Dialog",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Bottom Sheet Trigger Button
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            children: const [
                              SizedBox(height: 20),
                              Text("This is bottom sheet"),
                              SizedBox(height: 20),
                              Text("This is bottom sheet"),
                              SizedBox(height: 20),
                              Text("This is bottom sheet"),
                              SizedBox(height: 20),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 7, 240),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Show Bottom sheet",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            StackScreen(),
          ],
        ),
      ),
    );
  }
}
