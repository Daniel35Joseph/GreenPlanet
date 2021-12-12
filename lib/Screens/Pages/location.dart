import 'package:flutter/material.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.black,
                onPressed: () {
                  // Respond to button press
                },
                child: Icon(Icons.add),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      );
  }
}

// )
