import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/homepage.dart';
import 'package:flutter_practice/registerpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    Future<bool> onwillpop()
  {
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        backgroundColor: Colors.deepOrange,
        title: Text("Are you sure ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        content: Text("Do you want to exit ?",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            onPressed: ()
            {
              Navigator.of(context).pop(exit(0));
            },
          ),

          FlatButton(
            child: Text("No",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            onPressed: ()
            {
              Navigator.of(context).pop(false);
            },
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onwillpop,
      child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Image(
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

            //theres no gap almost lets make some gap here

            Divider(
              color: Colors.transparent,
              height: 30.0,
            ),

            //username textfield
            TextField(
              keyboardType:
                  TextInputType.number, //for apprearing numeric keyboard only
              maxLength: 10,

              style: TextStyle(fontSize: 22.0, color: Colors.white),
              decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  hintText: "Mobile No",
                  hintStyle: TextStyle(fontSize: 25.0, color: Colors.white)),
              controller: username,
            ),

            Divider(
              color: Colors.transparent,
              height: 10.0,
            ),

            //passowrd textfield itself
            TextField(
              style: TextStyle(fontSize: 22.0, color: Colors.white),
              decoration: InputDecoration(
                  helperText: check == true ? "" : "Wrong credentials !!",
                  helperStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 25.0, color: Colors.white)),
              controller: password,
              obscureText: false,
            ),

            Divider(
              color: Colors.transparent,
              height: 40.0,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                splashColor: Colors.deepOrange,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16.0),
                ),
                color: Colors.white,
                onPressed: () {
                  if (username.text ==
                          "5460" && //and we will check both of them
                      password.text == "admin") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()));
                  } else {
                    print("sorry you have entereed wrong credentials");
                    setState(() {
                      check = false;
                      //changing the state of the textfield when i input wrong credetials through it
                      username.text = "";
                      password.text = "";
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.deepOrange,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegisterPage()));
        },
      ),
    ),
  
    )
    ;
  }

  ///this bracket ends statless widget

  final username = TextEditingController();
  final password = TextEditingController();
  bool check = true;
} //this bracket end stateful widget
