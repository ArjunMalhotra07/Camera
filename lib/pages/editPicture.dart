// import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:scan_app/pages/testPage.dart';

// import 'config.dart';

const apiKey =
    "ed233c386033a1ed1ef64ad92222a9cf77bc9c082c4a796177d78d3ae159ff60f836af39dae610b6";

class EditPicture extends StatefulWidget {
  EditPicture({
    Key? key,
    required this.pickedImage,
  }) : super(key: key);
  File? pickedImage;
  @override
  State<EditPicture> createState() => _EditPictureState();
}

class _EditPictureState extends State<EditPicture> {
  // late CameraDeepArController _controller;
  // final deepArController = CameraDeepArController(config);
  String _platformVersion = 'Unknown';
  bool isRecording = false;
  // CameraMode cameraMode = config.cameraMode;
  // DisplayMode displayMode = config.displayMode;
  int currentEffect = 0;

  // List get effectList {
  // switch (cameraMode) {
  //   case CameraMode.mask:
  //     return masks;

  //   case CameraMode.effect:
  //     return effects;

  //   case CameraMode.filter:
  //     return filters;

  //   default:
  //     return masks;
  // }
  // }

  List masks = [
    "none",
    "assets/aviators",
    "assets/bigmouth",
    "assets/lion",
    "assets/dalmatian",
    "assets/bcgseg",
    "assets/look2",
    "assets/fatify",
    "assets/flowers",
    "assets/grumpycat",
    "assets/koala",
    "assets/mudmask",
    "assets/obama",
    "assets/pug",
    "assets/slash",
    "assets/sleepingmask",
    "assets/smallface",
    "assets/teddycigar",
    "assets/tripleface",
    "assets/twistedface",
  ];
  List effects = [
    "none",
    "assets/fire",
    "assets/heart",
    "assets/blizzard",
    "assets/rain",
  ];
  List filters = [
    "none",
    "assets/drawingmanga",
    "assets/sepia",
    "assets/bleachbypass",
    "assets/realvhs",
    "assets/filmcolorperfection"
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   CameraDeepArController.checkPermissions();
  //   deepArController.setEventHandler(DeepArEventHandler(onCameraReady: (v) {
  //     _platformVersion = "onCameraReady $v";
  //     setState(() {});
  //   }, onSnapPhotoCompleted: (v) {
  //     _platformVersion = "onSnapPhotoCompleted $v";
  //     setState(() {});
  //   }, onVideoRecordingComplete: (v) {
  //     _platformVersion = "onVideoRecordingComplete $v";
  //     setState(() {});
  //   }, onSwitchEffect: (v) {
  //     _platformVersion = "onSwitchEffect $v";
  //     setState(() {});
  //   }));
  // }

  // @override
  // void dispose() {
  //   deepArController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(child: const Text("Filter.It")),
        foregroundColor: Colors.black,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getimageditor();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DownloadEditedPicture()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.edit),
      ),
      body: Center(
          child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20, left: 20, right: 20),
                child: Image.file(widget.pickedImage!),
              )),
        ],
      )),
    );
  }
}
