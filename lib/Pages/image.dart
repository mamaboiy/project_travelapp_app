import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  const TakeImage({super.key});

  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  File? _image;

  Future imageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _image = File(returnImage.path);
    });
  }
  Future imageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _image = File(returnImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          imageFromGallery();
        },
        child: Icon(Icons.add),
      ),
      body: Row(
        children: [
          Center(
            child: _image != null
                ? CircleAvatar(
                    backgroundImage: FileImage(_image!),
                  )
                : Text("Select an Image"),
          ),
        ],
      ),
    );
  }
}
