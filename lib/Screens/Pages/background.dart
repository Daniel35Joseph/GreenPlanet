import 'package:flutter/material.dart';
import 'package:flutter_auth/components/NavDrawer.dart';

import '../../constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('LOCATIONS'),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
