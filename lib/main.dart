import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Screens/Login_Registration/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text(
        'Mon Jardin',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.white),
      ),
      image: new Image.asset(
          'assets/images/jardin_mon_logo-removebg-preview.png'),
      backgroundColor: kPrimaryColor,
      loaderColor: Colors.white,
    );
  }
}

class AfterSplash extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
