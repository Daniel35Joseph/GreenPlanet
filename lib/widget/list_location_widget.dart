import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/list_location.dart';
import 'package:flutter_auth/Screens/Pages/location.dart';
import 'package:flutter_auth/constants.dart';

class ListLocationWidget extends StatelessWidget {
  final ListLocation location;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const ListLocationWidget({
    this.location,
    this.animation,
    this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => buildLocation();

  Widget buildLocation() => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryLightColor,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(location.urlImage),
          ),
          title: Text(
            location.title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red, size: 32),
            onPressed: onClicked,
          ),
        ),
      );
}
