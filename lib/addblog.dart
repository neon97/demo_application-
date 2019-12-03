import 'package:flutter/material.dart';
import 'package:flutter_practice/homepage.dart';
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
    var image = await ImagePicker.pickImage(
        //you can change the source of image by Gallery/Camera
        source: ImageSource.camera,
        maxHeight: 800,
        maxWidth:
            800); //i have define the dimension so as to compress the image....while uploading
    //source: ImageSource.camera, maxHeight: 800, maxWidth: 800);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
        height: 257, //defineing the container fopr the image
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
                        color: Colors.deepOrange,
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
                        color: Colors.deepOrange,
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
                        fit: BoxFit
                            .cover, //fitting the image to cover the box(Container defined)
                      ),
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
              ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Blog !!"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        height: MediaQuery.of(context)
            .size
            .height, //using mediaquery defines that it will automatically adjust
        width: MediaQuery.of(context)
            .size
            .width, //according to the device screen size whether its big or small
        padding: EdgeInsets.all(15.0),
        child: ListView(
          //listview provide a scrollable widget not the column nor the row provides you the same..
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
// Image Box
            GestureDetector(
              child: container,
              onTap: getImage, //incase you want to change the other image....
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 100.0, 10.0),
              child: TextField(
                controller: title,
                style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle:
                        TextStyle(color: Colors.deepOrange, fontSize: 20.0)),
              ),),

              TextField(
                controller: subtitle,
                style: TextStyle(fontSize: 18.0, color: Colors.deepOrange),
                decoration: InputDecoration(
                    hintText: "Subtitle",
                    hintStyle:
                        TextStyle(color: Colors.deepOrange, fontSize: 18.0)),
              ),

              Divider(color: Colors.transparent,height: 15.0,),

              TextField(
                controller: details,
                maxLines: 5,
                style: TextStyle(fontSize: 18.0, color: Colors.deepOrange),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                    hintText: "Details",
                    hintStyle:
                        TextStyle(color: Colors.deepOrange, fontSize: 18.0)),
              ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        backgroundColor: Colors.deepOrange,
        onPressed: ()
        {
          if(_image == null || title.text == "" || subtitle.text == "" || details.text.isEmpty)
          {
            print("sir you have left the fields empty");
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));
          }
          
        },
      ),
    );
  }

  final title = TextEditingController();
  final subtitle = TextEditingController();
  final details = TextEditingController();
}
