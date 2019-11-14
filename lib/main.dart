import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/secondpage.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "Exo2",
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigation);
  }

  void navigation() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SecondPage()));
  }

  //this is navigation part that has toi viewed after the duration...

  @override
  void initState() {
    //boilerplate for intizialition the application shortcut is init
    // TODO: implement initState
    super.initState();
    // startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //coloring the container itself
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //as column is alwayd in vertical direction itself
            //so the main axis will be vertical itself
            //cross alignment will be horizontal
            children: <Widget>[
              Image(
                // image: NetworkImage("https://png.pngtree.com/element_our/png/20180912/coffee-time-png_91570.jpg"),
                ///you can paste url of an image inside the Network Image("url")
                ///for An Asset Image just add the image in an folder then add it to pubspec.yaml then to the AssestImage("name ot the image")
                image: AssetImage("image/logo.png"),
              ),
              Text(
                "BlogPage",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text("You have landed to the world of Blogs")
            ],
          ),
        ),
      ),
    );
  }
}
