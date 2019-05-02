import 'package:flutter/material.dart';
import 'package:four_writers/screens/login_screen.dart';
import 'package:four_writers/screens/homepage.dart';
import 'package:four_writers/screens/signup_screen.dart';
import 'home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
