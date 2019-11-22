import 'package:flutter/material.dart';
import 'list.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Trending"),
        centerTitle: true,
      ),

      //drwer
      
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
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                
                Row(
                  children: <Widget>[
                    Text("5",style: TextStyle(fontSize: 20.0),),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(Icons.favorite,color: Colors.red,)
                  ],
                )

                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
} //ending statefull widget
