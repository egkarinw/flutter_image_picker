import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ClassifyPage extends StatefulWidget {
  const ClassifyPage({Key? key}) : super(key: key);

  @override
  State<ClassifyPage> createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  String urlFile = "";
  final imgPicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            showButton(),
            const SizedBox(height: 50),
            showImage(),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        child: urlFile == ""
            ? const SizedBox(height: 150)
            : Image.file(File(urlFile)));
  }

  Widget showButton() {
    return Center(
      child: IconButton(
        onPressed: () => selectImage(ImageSource.gallery),
        icon: const Icon(
          Icons.add_photo_alternate,
          size: 60,
          color: Colors.purple,
        ),
      ),
    );
  }

  Future selectImage(ImageSource imgSource) async {
    final XFile? myImg = await imgPicker.pickImage(
      source: imgSource,
      maxHeight: 500,
      maxWidth: 500,
    );
    myImg == null
        ? setState(() {
            urlFile = "";
          })
        : setState(
            () {
              urlFile = myImg.path;
            },
          );
  }
}
