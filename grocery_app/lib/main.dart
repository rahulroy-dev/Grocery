import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/cart.dart';
import 'package:grocery_app/landingScreen.dart';
import 'package:grocery_app/signIn.dart';
import 'package:grocery_app/signUp.dart';
import 'package:grocery_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
      routes: {
        MyRoutes.signin: (context) => SignIn(),
        MyRoutes.signup: (context) => SignUp(),
        MyRoutes.landingscreen: (context) => LandingScreen(),
        MyRoutes.cart: (context) => Mycart(),
      },
      //LandingScreen(),
    );
  }
}
