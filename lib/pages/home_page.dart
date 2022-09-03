import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan_app/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: const Text("Filter.It")),
        foregroundColor: Colors.black,
        backgroundColor: Colors.blue,
      ),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //           ),
      //           child: Center(
      //             child: Text('Profile'),
      //           )),
      //       ListTile(
      //         title: Center(child: const Text('Log Out')),
      //         onTap: () async => {
      //           await FirebaseAuth.instance.signOut(),
      //           await storage.delete(key: "uid"),
      //           Navigator.pushAndRemoveUntil(
      //               context,
      //               MaterialPageRoute(builder: (context) => const LoginPage()),
      //               ((route) => false))
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onPressed: () {
                            pickImage(ImageSource.camera);
                          },
                          child: const Icon(Icons.camera_alt_outlined)),
                    ),
                    const SizedBox(width: 40),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                          },
                          child: const Icon(Icons.browse_gallery)),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: pickedImage != null
                      ? Container(
                          height: 300,
                          width: 300,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.file(pickedImage!),
                          ),
                        )
                      : const CircleAvatar(
                          radius: 102,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/camera.png'),
                            radius: 100,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
