import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../home_widget.dart';
import '../globals.dart' as globals;

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            _showLogo(),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                icon: new Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains("@"))
                  return "E-mail inválido!";
              },
              onSaved: (text) {
                _email = text;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Senha",
                icon: new Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return "Senha inválida";
              },
              onSaved: (text) {
                _password = text;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    Firestore.instance
                    .collection('users')
                    .where('email', isEqualTo: this._email)
                    .where('password', isEqualTo: this._password)
                    .snapshots()
                    .listen((data) => data.documents.forEach((doc) {
                          if (doc["email"] != null) {
                            globals.isLoggedIn = true;
                            globals.username   = doc["name"];
                            globals.email      = doc["email"];

                            Route route = MaterialPageRoute(builder: (context) => Home());
                            Navigator.push(context, route);
                          }
                          else print("wrong password");
                    }));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100.0,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
