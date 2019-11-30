import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class ImagePost extends StatefulWidget {
  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {

//Image Picker
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(                                //you can change the source of image by Gallery/Camera
        source: ImageSource.camera, maxHeight: 800, maxWidth: 800);        //i have define the dimension so as to compress the image....while uploading
        //source: ImageSource.camera, maxHeight: 800, maxWidth: 800);     

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
        height: 257,                              //defineing the container fopr the image
        width: 400,
        child: _image == null
            ? DecoratedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.camera,
                        size: 50.0,
                        color: Colors.black,
                      ),
                      onTap: getImage,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 5.0,
                    ),
                    Text(
                      "Upload Pic from Gallery!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
              )
            : DecoratedBox(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 257,
                      width: 400,
                      child: Image.file(
                        _image,
                        fit: BoxFit.cover,      //fitting the image to cover the box(Container defined)
                      ),
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
              ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Image !!"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,     //using mediaquery defines that it will automatically adjust 
        width: MediaQuery.of(context).size.width,       //according to the device screen size whether its big or small 
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Divider(
              color: Colors.transparent,
              height: 15,
            ),

// Image Box
            GestureDetector(
              child: container,
              onTap: getImage,        //incase you want to change the other image....
            ),
          ],
        ),
      ),
    );
  }
}