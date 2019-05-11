import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomepageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('stories').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
        return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
          return new Scaffold(
            body: ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: new Text(document['title']),
                    subtitle: new Text(document['script']),
                    isThreeLine: true,
                  );
              }).toList()
            )
          );
        }
      },
    );
  }
}
