import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/list_location.dart';
import 'package:flutter_auth/Screens/Pages/addLocation.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/list_locations.dart';
import 'package:flutter_auth/widget/list_location_widget.dart';

import 'background.dart';

class Location extends StatelessWidget {
  static final listKey = GlobalKey<AnimatedListState>();
  static final List<ListLocation> locations = List.from(listLocations);

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('LOCATIONS'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: locations.length,
        itemBuilder: (context, index, animation) => ListLocationWidget(
          location: locations[index],
          animation: animation,
          onClicked: () => removeLocation(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: insertTheLocation(0),
        // onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return AddLocation();
        //     },
        //   ),
        // );
        // },
      ));

  //Getters
  static List<ListLocation> getLocations() {
    return locations;
  }

  static GlobalKey<AnimatedListState> getListKey() {
    return listKey;
  }

  VoidCallback insertTheLocation(int index) {
    List<ListLocation> locations = Location.getLocations();

    insertLocation() {
      final newIndex = 0;
      final newLocation = ListLocation(
        title: 'New',
        urlImage:
            'https://upload.wikimedia.org/wikipedia/commons/8/84/SH.A_Logo.jpg',
      );

      locations.insert(newIndex, newLocation);
      listKey.currentState.insertItem(newIndex);
    }

    ;
  }

  void removeLocation(int index) {
    final removedLocation = locations[index];

    locations.removeAt(index);
    listKey.currentState.removeItem(
      index,
      (context, animation) => ListLocationWidget(
        location: removedLocation,
        animation: animation,
        onClicked: () {},
      ),
    );
  }
}
