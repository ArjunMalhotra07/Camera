import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cameraLogo = const CircleAvatar(
    radius: 102,
    backgroundColor: Colors.blue,
    child: CircleAvatar(
      backgroundImage: AssetImage('assets/camera.png'),
      radius: 100,
    ),
  );
  final camera = Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(30),
    color: Colors.blue,
    child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {},
        child: const Icon(Icons.camera_alt_outlined)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                cameraLogo,
                const SizedBox(height: 40),
                camera,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
