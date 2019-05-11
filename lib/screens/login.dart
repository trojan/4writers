import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: SafeArea(
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  new Container(
                    height: 100.0,
                    child: new Tab(text: 'LOGIN'),
                  ),
                  new Container(
                    height: 100.0,
                    child: new Tab(text: 'REGISTRAR'),
                  ),
                ],
              )
            )
          ),
          body: TabBarView(
            children: [
              LoginScreen(),
              SignUpScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
