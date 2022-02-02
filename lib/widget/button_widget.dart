import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  // ignore: deprecated_member_use
  Widget build(BuildContext context) => RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        shape: StadiumBorder(),
        color: kPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textColor: Colors.white,
        onPressed: onClicked,
      );
}
