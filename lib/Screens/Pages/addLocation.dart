import 'dart:developer';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/list_location.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Pages/locationScreen.dart';
import 'package:flutter_auth/Screens/Pages/locationScreen.dart';
import 'package:flutter_auth/components/NavDrawer.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/data/list_locations.dart';
import 'package:flutter_auth/widget/button_widget.dart';

import '../../constants.dart';

class AddLocation extends StatefulWidget {
  final String title;

  const AddLocation({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<AddLocation> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String urlImage = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add Location'),
          backgroundColor: kPrimaryColor,
        ),
        body: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildTitle(),
              const SizedBox(height: 16),
              buildImage(),
              const SizedBox(height: 32),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        scrollPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        cursorColor: kPrimaryColor,
        cursorWidth: 0.8,
        decoration: InputDecoration(
          icon: new Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "Location Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: new BorderSide(
              color: kPrimaryColor,
              width: 5.0,
            ),
          ),
        ),

        // errorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        // focusedErrorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        // errorStyle: TextStyle(color: Colors.purple),

        validator: (value) {
          if (value.length < 3) {
            return 'Enter at least 3 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => title = value),
      );

  Widget buildImage() => TextFormField(
        cursorColor: kPrimaryColor,
        cursorWidth: 0.8,
        scrollPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: InputDecoration(
          icon: new Icon(
            Icons.image,
            color: kPrimaryColor,
          ),
          hintText: "Image Url",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: new BorderSide(
              color: kPrimaryColor,
              width: 5.0,
            ),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a link';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => setState(() => urlImage = value),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState.save();

              addNewLocation(title, urlImage);

              final message = 'Title: $title\nImage Url: $urlImage';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: kPrimaryLightColor,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LocationScreen();
                  },
                ),
              );
            }
          },
        ),
      );
}

void addNewLocation(String title, String urlImage) {
  DatabaseReference _counter =
      FirebaseDatabase.instance.reference().child("locations_counter");
  int counter = 0;
  DatabaseReference _testRef =
      FirebaseDatabase.instance.reference().child("Locations");
  DatabaseReference _ref = _testRef.child("Location_$counter");
  listLocations.add(
    ListLocation(
      title: title,
      urlImage: urlImage,
    ),
  );
  _ref.child("Title").set(title);
  _ref.child("Image").set(urlImage);
  counter =counter+1;
  _counter.set(counter);
}

// class AddLocation extends StatelessWidget {
//   const AddLocation({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text('Add Location'),
//         backgroundColor: kPrimaryColor,
//       ),
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RoundedInputField(
//                 hintText: "Location Name",
//                 onChanged: (value) {},
//               ),
//               RoundedInputField(
//                 hintText: "Image url",
//                 icon: Icons.image,
//                 onChanged: (value) {},
//               ),
//               RoundedButton(
//                 text: "Create",
//                 press: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return Location();
//                       },
//                     ),
//                   );
//                 },
//               )
//             ]),
//       ),
//     );
//   }

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
// }
