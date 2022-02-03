import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Pages/locationScreen.dart';
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
  String plantName = '';

  final plantTypes = ['aloeplant', 'bamboo', 'jasmine', 'monstera', 'sunflower'];
  String value;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add New Plant'),
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
              const SizedBox(height: 16),
              buildPlantDropDown(),
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(
              color: kPrimaryLightColor,
              width: 3,
            ),
          ),
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(
              color: kPrimaryLightColor,
              width: 3,
            ),
          ),
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
        keyboardType: TextInputType.url,
        onSaved: (value) => setState(() => urlImage = value),
      );

  Widget buildPlantDropDown() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(29),
      border: Border.all(
        color: kPrimaryColor,
        width: 2,
      )
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
    margin: EdgeInsets.all(16),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: Text("Choose Plant Type"),
        dropdownColor: kPrimaryLightColor,
        icon: Icon(
          Icons.arrow_drop_down,
          size: 26,
          color: kPrimaryColor,
        ),
        value: value,
        isExpanded: true,
        items: plantTypes.map(buildMenuItem ).toList(),
        onChanged: (value) => setState(() {
          plantName = value;
          this.value = value;
        }),
        borderRadius: BorderRadius.circular(29),
      )
    )
  );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState.validate();

            if (isValid) {
              formKey.currentState.save();

              addNewLocation(title, urlImage, plantName);

              final message = 'Title: $title\nImage Url: $urlImage';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
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


void addNewLocation(String title, String urlImage, String plantName) {
  DatabaseReference _testRef =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child("Locations");
  DatabaseReference _ref = _testRef.child("Location_${Random().nextInt(100)}");
  _ref.child("Title").set(title);
  _ref.child("Image").set(urlImage);
  _ref.child("plantname").set(plantName);
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
