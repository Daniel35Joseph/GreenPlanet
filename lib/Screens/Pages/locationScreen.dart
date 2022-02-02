import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Pages/addLocation.dart';
import 'package:flutter_auth/Screens/Pages/pot.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<LocationScreen>{
  Query _ref;
  DatabaseReference reference = FirebaseDatabase.instance.reference().child('Locations');

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
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
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red, size: 32),
          onPressed: () {
            _showDeleteDialog(location: location);
          }
        ),
        title: Text(
          location['Title'],
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Pot(title: location["Title"], image: location['Image'],);
              },
            ),
          );
        },
      ),
    );
  }

  _showDeleteDialog({Map location}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${location['Title']}'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () {
                    reference.child(location['key']).remove().whenComplete(() => Navigator.pop(context));
                  },
                  child: Text('Delete'))
            ],
          );
        });
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('POTS'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            Map location = snapshot.value;
            location['key'] = snapshot.key;
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
