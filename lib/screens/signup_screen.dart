import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../home_widget.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _nickname;
  String _password;

  // Stores the user in the firebase database.
  Future<void> storeData() async {
    try {
      await Firestore.instance.collection('users').document()
      .setData({ 'name': _nickname, 'email': _email, 'password': _password });
    } catch (e) {
      throw("Couldn't store the data, please check your internet connection.");
    }
  }

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
                hintText: "NickName",
                icon: new Icon(
                  Icons.recent_actors,
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty) return "Already beign used!";
              },
              onSaved: (text) {
                _nickname = text;
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

                    // Stores the user and goes to the Home page.
                    storeData().then((_) {
                        Route route = MaterialPageRoute(builder: (context) => Home());
                        Navigator.push(context, route);
                    })
                    .catchError((err) => print(err));
                  }
                },
              ),
            )
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
