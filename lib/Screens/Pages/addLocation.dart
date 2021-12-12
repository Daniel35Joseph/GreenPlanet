import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Pages/location.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/components/rounded_button.dart';

import '../../constants.dart';


class AddLocation extends StatelessWidget{
  const AddLocation({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('LOCATIONS'),
        backgroundColor: kPrimaryColor,
      ),
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedButton(
              text: "Create",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Location();
                    },
                  ),
                );

              },
            )
          ]
        ),


        ),

    );
  }
}