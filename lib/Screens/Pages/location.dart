import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/list_location.dart';
import 'package:flutter_auth/Screens/Pages/addLocation.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/data/list_locations.dart';
import 'package:flutter_auth/widget/list_location_widget.dart';

import 'background.dart';

class Location extends StatelessWidget {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListLocation> locations = List.from(listLocations);

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
          onClicked: () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddLocation();
              },
            ),
          );
        },
      ));

  void removeItem(int index) {
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

  // const Location({
  //   Key key,
  // }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     drawer: NavDrawer(),
  //     appBar: AppBar(
  //       title: Text('LOCATIONS'),
  //       backgroundColor: kPrimaryColor,
  //     ),
  //     body: Center(
  //       child: Align(
  //         alignment: Alignment(0.95, 0.95),
  //         child: FloatingActionButton(
  //           backgroundColor: kPrimaryColor,
  //           foregroundColor: Colors.white,
  //           onPressed: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) {
  //                   return AddLocation();
  //                 },
  //               ),
  //             ); // Respond to button press
  //           },
  //           child: Icon(Icons.add),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// )
