import 'package:flutter/material.dart';
import 'package:four_writers/screens/home/home_screen.dart';
import 'package:four_writers/screens/home/tabs/widgets/animated_list_view.dart';
import 'screens/login/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4Writers',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
