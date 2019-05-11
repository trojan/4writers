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
      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
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
                    //storeData().then((_) => {
                    //    Route route = MaterialPageRoute(builder: (context) => HomepageWidget());
                    //    Navigator.push(context, route);
                    //})
                    //.catchError((err) => print(err));
 
                    //await Firestore.instance.collection('users').document()
                    //.setData({ 'name': _nickname, 'email': _email, 'password': _password });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
