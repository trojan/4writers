import 'package:flutter/material.dart';
import 'package:four_writers/screens/login/login.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 90,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      },
      child: Text(
        "Login",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
