import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child:
          Text(
            globals.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.00),
          ),
      )
    );
  }
}
