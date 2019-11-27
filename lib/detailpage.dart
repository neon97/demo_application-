import 'package:flutter/material.dart';
import 'package:flutter_practice/list.dart';
import 'package:flutter_tags/tag.dart';

class Details extends StatefulWidget {
  final List<String>
      demoImage; //it will get all the contents of the blogimage itself
  final int index; //it wil take the index of the earlier card
  final List<String> title;
  final List<String> subtitle;

  Details({
    this.title,
    this.subtitle,
    this.index,
    this.demoImage,
  });
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.demoImage[widget.index]),
                      fit: BoxFit.cover)),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.deepOrange,
                child: Center(
                  child: Text(
                    widget.title[widget.index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    widget.subtitle[widget.index],
                    style: TextStyle(fontSize: 18.0),
                  ),

                  Divider(
                    color: Colors.transparent,
                    height: 20.0,
                  ),

                  Text(
                    "Tags :",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10.0,
                  ),

                  //tags
                  Tags(
                    itemCount: taggs.length,
                    itemBuilder: (int index) {
                      return Tooltip(
                        message: "Tags",
                        child: ItemTags(
                          activeColor: Colors.deepOrange,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          index: index,
                          title: item[index],
                        ),
                      );
                    },
                  ),

                  //decsriotion
                  Divider(
                    color: Colors.transparent,
                    height: 30.0,
                  ),
                  Text(
                    "Description :",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10.0,
                  ),
                  Text(
                    details[widget.index],
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
