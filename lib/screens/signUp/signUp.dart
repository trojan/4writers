import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:four_writers/screens/signUp/widgets/form_container.dart';
import 'package:four_writers/screens/signUp/widgets/login_button.dart';
import 'package:four_writers/screens/signUp/widgets/stagger_animation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/teste.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 30),
                      child: Image.asset(
                        "images/logo.png",
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    LoginButton(),
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController.view,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
