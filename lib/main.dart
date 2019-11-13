//importing libraries

import 'package:flutter/material.dart';
import 'package:flutter_practice/secondpage.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    debugShowCheckedModeBanner: false,     // to remove debuuging banner from the app tou can use this...
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int number = 1; //datatype integer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        //remeber you have to use mediaquerry in your first container so that you mae an dynamic app that can run on all devices itself....

        color: Colors.red, 
        child: Center(
          child: Container(
            height: 50.0,
            width: 50.0,
            color: Colors.green
          ),
        ),   //parent container with red color
        
       
      ),


      //mediaquerry


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          ///this is how you can navigate to the next page itself....for going ahead you need to use 
          ///PUSH
          ///for popping some of the screen 
          ///POP is required...which will be explaineid in the sessions afterward...till taht please have an RND with push...
          
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondPage()));   //pushing to second page


        },
      ),
    );
  }
}

// for running your application ::::  flutter run on terminal

//hot resload :: r
//hot Restart :: R

///to build your appliocation in puvlish mode:   ::: flutter build apk
///
///@ tht moment location will be seen on the termonal itself...
///
///for stopping ending application :::::: q
///






