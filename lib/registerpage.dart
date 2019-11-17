import 'package:flutter/material.dart';
import 'package:flutter_practice/loginpage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepOrange,
        child: ListView(
          children: <Widget>[
            Image(
              image: AssetImage("image/logo.png"),
              height: 150.0,
              width: 150.0,
            ),
            Text(
              "BlogPage",
              textAlign: TextAlign
                  .center, //to make the text get align in the centre of the row itself  not the column or not the body...
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 10.0,
            ),

//name
            TextField(
              style: TextStyle(fontSize: 22.0, color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Name*",
                  hintStyle: TextStyle(fontSize: 25.0, color: Colors.white)),
              controller: name,
            ),
             Divider(
              color: Colors.transparent,
              height: 15.0,
            ),

//mobileno

            TextField(
              keyboardType:
                  TextInputType.number, //for apprearing numeric keyboard only
              maxLength: 10,

              style: TextStyle(fontSize: 22.0, color: Colors.white),
              decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  hintText: "Mobile No*",
                  hintStyle: TextStyle(fontSize: 25.0, color: Colors.white)),
              controller: mobileno,
            ),

//email

            TextField(
              keyboardType: TextInputType
                  .emailAddress, //for apprearing numeric keyboard only

              style: TextStyle(fontSize: 22.0, color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 25.0, color: Colors.white)),
              controller: email,
            ),
             Divider(
              color: Colors.transparent,
              height: 15.0,
            ),

//password

            TextField(
                style: TextStyle(fontSize: 22.0, color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Password*",
                    hintStyle: TextStyle(fontSize: 25.0, color: Colors.white)),
                controller: pasword),

                 Divider(
              color: Colors.transparent,
              height: 20.0,
            ),

//register page
            Padding(
              padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                splashColor: Colors.deepOrange,
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 16.0),
                ),
                color: Colors.white,
                onPressed: () {
                  if (name.text.isEmpty ||
                      mobileno.text.isEmpty ||
                      pasword.text.isEmpty) {
                    print("you have left fields empty !!");
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  final name = TextEditingController();
  final mobileno = TextEditingController();
  final email = TextEditingController();
  final pasword = TextEditingController();
}
