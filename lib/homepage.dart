import 'package:flutter/material.dart';
import 'package:flutter_practice/loginpage.dart';
import 'package:flutter_practice/trendingpage.dart';
import 'list.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {

  Future<bool> onwillpop()
  {
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        backgroundColor: Colors.deepOrange,
        title: Text("Are you sure ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        content: Text("Do you want to logout ?",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            onPressed: ()
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
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
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Hii, Raj"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),

      //drwer
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              accountEmail: Text("raj@gmail.com"),
              accountName: Text("Raj"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("image/logo.png"),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.home),
              title: Text("Homepage"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
            ListTile(
              trailing: Icon(Icons.trending_up),
              title: Text("Trendingpage"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TrendingPage()));
              },
            )
          ],
        ),
      ),

//asume it we have 10 blogs.....

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          //listview helps us to make a scrollable widgets....
          //listview and listview.builder
          children: <Widget>[for (int i = 0; i < 5; i++) texting(context, i)],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          print("You can add your blogs here !!!");
        },
      ),
    ),
    );
  }

  //ending of stateless widget   it only works for UI itself

  Widget texting(BuildContext context, int index) {
    double deviceHeight = MediaQuery.of(context).size.height / 3;
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Card(
        elevation: 5.0,
        child: Container(
          height: deviceHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: deviceHeight / 1.35,
                width: MediaQuery.of(context).size.width,
                child: FadeInImage(
                  image: NetworkImage(blogimage[index]),
                  placeholder: AssetImage("image/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: deviceHeight / 4,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      item[index],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 3.0,
                    ),
                    Text(
                      blogsubtitle[index],
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
} //ending statefull widget
