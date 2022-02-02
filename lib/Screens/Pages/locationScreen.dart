import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Pages/addLocation.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<LocationScreen>{
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("Locations");
  }

  Widget _buildLocationItem({Map location}){
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryLightColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(location['Image']),
        ),
        title: Text(
          location['Title'],
          style: TextStyle(fontSize: 20, color: Colors.black),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('LOCATIONS'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            Map location = snapshot.value;
            return _buildLocationItem(
              location: location
            );
          }
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
                return AddLocation(
                title: "Insert Title Here",
                );
              },
            ),
          );
        },
      )
    );
  }
}
