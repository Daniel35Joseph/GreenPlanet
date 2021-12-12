import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Pages/addLocation.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/constants.dart';

import 'background.dart';

class Location extends StatelessWidget {
  const Location({
    Key key,
  }) : super(key: key);

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('LOCATIONS'),
          backgroundColor: kPrimaryColor,
        ),
          body: Center(
          child: Align(
            alignment: Alignment.bottomRight,
              child:FloatingActionButton(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddLocation();
                    },
                  ),
                  ); // Respond to button press
                },
                child: Icon(Icons.add),
              ),
          ),
        ),
      );
  }
}

// )
