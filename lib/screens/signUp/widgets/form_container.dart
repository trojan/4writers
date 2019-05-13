import 'package:flutter/material.dart';
import 'package:four_writers/screens/signUp/widgets/input_field.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Usuario",
              obscure: false,
              icon: Icons.person_outline,
            ),
            InputField(
              hint: "E-mail",
              obscure: false,
              icon: Icons.alternate_email,
              keyBord: TextInputType.emailAddress,
            ),
            InputField(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock_outline,
            )
          ],
        ),
      ),
    );
  }
}
