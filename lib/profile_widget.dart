import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'globals.dart' as globals;

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _showProfilePic(),
            Text(
              globals.username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.00),
            ),
            Text(
              globals.email,
              style: TextStyle(fontSize: 15.00),
            ),
            Divider(
              height: 50.00,
            ),
            FlatButton.icon(
              // color: Colors.teal,
              icon: Icon(Icons.favorite_border),
              label: Text('Favoritos'),
              textColor: Colors.grey,
              onPressed: () {
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.art_track),
              label: Text('Historias'),
              textColor: Colors.grey,
              onPressed: () {
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Preferencias'),
              textColor: Colors.teal,
              onPressed: () {
              },
            ),
            FlatButton.icon(
                color: Colors.teal,
                icon: Icon(Icons.exit_to_app),
                label: Text('LOGOUT'),
                textColor: Colors.white,
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => Login());
                  Navigator.push(context, route);
                },
              ),
          ]
        ),
      ),
    );
  }

  Widget _showProfilePic() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 70.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80.0,
          child: Image.asset('assets/user.png'),
        ),
      ),
    );
  }
}
