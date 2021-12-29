import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/list_location.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Pages/location.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/data/list_locations.dart';

import '../../constants.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Add Location'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedInputField(
                hintText: "Location Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Image url",
                icon: Icons.image,
                onChanged: (value) {},
              ),
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
            ]),
      ),
    );
  }

  // VoidCallback insertLocation(int index) {
  //   List<ListLocation> locations = Location.getLocations();

  //   insertLocation() {
  //     final newIndex = 0;
  //     final listKey = Location.getListKey();
  //     final newLocation = ListLocation(
  //       title: 'New',
  //       urlImage:
  //           'https://upload.wikimedia.org/wikipedia/commons/8/84/SH.A_Logo.jpg',
  //     );

  //     locations.insert(newIndex, newLocation);

  //     listKey.currentState.insertItem(newIndex);
  //   }

  //   ;
  // }
}
