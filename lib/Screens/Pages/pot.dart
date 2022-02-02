import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/NavDrawer.dart';

import '../../constants.dart';

class Pot extends StatelessWidget{
  final String title;
  final String image;

  const Pot({Key key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavDrawer(),
    appBar: AppBar(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0,
    ),
    body: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: kPrimaryColor
          ),
          width: double.infinity,
          height: 280,
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 22),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Temp.",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    "20C",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Moisture",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    "30 g/m^3",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Humidity",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    "25%",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),

                  ),

                ],
              )
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Description",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sed massa vitae dui pretium vestibulum vehicula eget massa. Mauris lacinia congue erat a semper.",
                  style: TextStyle(
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 300,
          child: RaisedButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            elevation: 0,
            padding: EdgeInsets.all(0),
            child: Ink(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                alignment: Alignment.center,
                child: Text(
                  "Water Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 300,
          height: 20,
        ),
        Container(
          width: 300,
          child: RaisedButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            elevation: 0,
            padding: EdgeInsets.all(0),
            child: Ink(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
                alignment: Alignment.center,
                child: Text(
                  "Get Readings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );

}
