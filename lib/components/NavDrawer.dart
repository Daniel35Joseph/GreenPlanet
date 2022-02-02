import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Pages/locationScreen.dart';

import '../constants.dart';

/*
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}*/

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Mon Jardin',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.eco,
              color: kPrimaryColor,
            ),
            title: Text('My Plants'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LocationScreen();
                  },
                ),
              ); // Respond to button press
            },
          ),
          ListTile(
            leading: Icon(
              Icons.phone_android,
              color: kPrimaryColor,
            ),
            title: Text('Notifications'),
            // ignore: sdk_version_set_literal
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(
              Icons.switch_account_rounded,
              color: kPrimaryColor,
            ),
            title: Text('Switch Accounts'),
            onTap: () {
              // Respond to button press
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: kPrimaryColor,
            ),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.redAccent,
            ),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
