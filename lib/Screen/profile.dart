import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  // Variable to store the selected image
  var _selectedImage;

  // Method to select an image from the gallery
  _selectImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  // Method to take a picture using the camera
  _takePictureWithCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Your profile'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            width: 150.0,
            margin: EdgeInsets.only(right: 200),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                //color: Colors.cyan,
                image: DecorationImage(
                  image: AssetImage("lib/Assets/Images/image_profile.jpg"),
                )),
            child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () {},
              icon: Icon(
                Icons.add_a_photo,
                size: 30,
                color: Colors.black,
              ),
            ),
            /* child: Center(
              child: _selectedImage == null
                  ? Text('No image selected')
                  : Image.file(_selectedImage),
            )
            */
            /* margin: EdgeInsets.only(top: 20),
            child: Center(
              child: _selectedImage == null
                  ? Text('No image selected')
                  : Image.file(_selectedImage),
            ), */
          ),
          Container(
            margin: EdgeInsets.only(left: 200),
            child: TextButton(
              onPressed: _selectImageFromGallery,
              child: Text('Select image from gallery'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 200),
            child: TextButton(
              onPressed: _takePictureWithCamera,
              child: Text('Take picture with camera'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              labelText: 'First name ',
              hintText: 'First name',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              labelText: 'Last name ',
              hintText: 'Last name',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              labelText: 'About',
              hintText: 'About',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  /* User user = User_Preferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 5,
        title: Text('Your profile'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                color: Colors.brown,
                child: Center(
                  child: Text('Background image goes here'),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                      //child: Text('Content goes here'),
                      child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    physics: BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 24),
                      /* TextField_Widget(
                          label: "Full name",
                          text: user.name,
                          onChanged: (name) {}),
                      const SizedBox(height: 24),
                      TextField_Widget(
                          label: "Email",
                          text: user.email,
                          onChanged: (email) {}),
                      const SizedBox(height: 24),
                      TextField(
                          label: "About",
                          text: user.about,
                          onChanged : (about) {}),*/
                    ],
                  )),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 150.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_a_photo_sharp,
                    size: 30,
                    color: Colors.black,
                  )),
            ),
          )
        ],
      ),
    );
  } */

  /*  void selectedImage() {
    child:
    Center(
      child: _selectedImage == null
          ? Text('No image selected')
          : Image.file(_selectedImage),
    );
  } */
}
