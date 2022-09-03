// import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'dart:io';

import 'package:scan_app/pages/downloadPic.dart';

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
  int selectedIndex = 0;
  bool edit = false;
  List filters = [
    Colors.transparent,
    Colors.black54,
    Colors.blue.shade300,
    Colors.yellow.shade400,
    Colors.orange,
    Colors.pink.shade200,
    Colors.green,
    Colors.indigo,
    Colors.grey,
    Colors.red,
  ];

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
          setState(() {
            edit = !edit;
          });
          // getimageditor();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => DownloadEditedPicture()),
          // );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.edit),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 10, left: 20, right: 20),
              child: ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(filters[selectedIndex], BlendMode.color),
                  child: Image.file(widget.pickedImage!)),
            ),
            SizedBox(
              height: 30,
            ),
            edit ? SizedBox(height: 200, child: colorPallette()) : Container()
          ],
        ),
      )),
    );
  }

  Widget coloredContainer(int index) {
    return Container(height: 50, width: 50, color: filters[index]);
  }

  Widget colorPallette() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: filters[index]),
                  color: filters[index],
                ),
                height: 40,
                width: 40,
              ));
        },
      ),
    );
  }
}
