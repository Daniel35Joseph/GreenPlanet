import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/NavDrawer.dart';

import '../../constants.dart';

class Pot extends StatelessWidget{
  final String title;

  const Pot({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavDrawer(),
    appBar: AppBar(
      title: Text("title"),
      backgroundColor: kPrimaryColor,
      centerTitle: true,
    ),
  );

}
