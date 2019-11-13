import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secondpage"),
        centerTitle: true,
      ),
      

      body: Container(
        child: Center(
          child: Text("You have landed to the secong page itself..."),
        ),
      ),
    );
  }
}