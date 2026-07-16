import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StackScreen> {
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
    return Scaffold(
      appBar: AppBar(title: Column(children: [const Text("Foodie")])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(radius: 30, child: Icon(Icons.person, size: 35)),
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
                Navigator.pop(context); // Drawer close karne ke liye
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
            const Divider(), // Ek clean line separating items
            // Logout Menu Item
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                _showLogoutDialog(
                  context,
                ); // Logout par click karne se dialog khulega
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  // FIXED: Added the missing 'child:' property identifier here
                  child: const Center(child: Text("RED Container ")),
                ),

                Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    // FIXED: Added the missing 'child:' property identifier here
                    child: const Center(child: Text("Yellow Container ")),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Spacer(),
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}
