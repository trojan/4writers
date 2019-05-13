import 'package:flutter/material.dart';
import 'package:four_writers/screens/signUp/signUp.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 50,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
      child: Text(
        "Não possui conta? Cadastre-se!",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
