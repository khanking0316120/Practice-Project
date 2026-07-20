import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  File? _image;

  void pickImagefromgallery() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickFile != null) {
      setState(() {
        _image = File(pickFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        // child: Center(
        //   child: Text("Setting Screen", style: TextStyle(fontSize: MediaQuery.of(context).size.width,)

        //   ),

        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pickImagefromgallery();
              },
              child: Text("PICK image"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Camera")),
          ],
        ),
      ),
    );
    ;
  }
}
