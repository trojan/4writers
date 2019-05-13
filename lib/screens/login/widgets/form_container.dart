import 'package:flutter/material.dart';
import 'package:four_writers/blocks/login_block.dart';
import 'package:four_writers/screens/login/widgets/input_field.dart';
import 'package:four_writers/screens/login/widgets/stagger_animation.dart';

class FormContainer extends StatelessWidget {
  final _loginBlock = LoginBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputField(
            hint: "E-mail",
            obscure: false,
            icon: Icons.person_outline,
            stream: _loginBlock.outEmail,
            onChanged: _loginBlock.changeEmail,
          ),
          InputField(
            hint: "Senha",
            obscure: true,
            icon: Icons.lock_outline,
            stream: _loginBlock.outPassword,
            onChanged: _loginBlock.changePassword,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Esqueci minha senha!",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<bool>(
              stream: _loginBlock.outSubmitValid,
              builder: (context, snapshot) {
                return SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: Color.fromRGBO(0, 105, 92, 1.0),
                    child: Text("Entrar"),
                    onPressed: snapshot.hasData ? _loginBlock.submit : null,
                    textColor: Colors.white,
                    disabledColor:
                        Color.fromRGBO(0, 105, 92, 1.0).withAlpha(140),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
