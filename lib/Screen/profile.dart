import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  dynamic _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: _pickedImage != null
              ? DecorationImage(
            image: FileImage(File(_pickedImage.path)),
            fit: BoxFit.cover,
          )
              : null,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
