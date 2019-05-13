import 'package:flutter/material.dart';
// import 'package:four_writers/blocks/login_block.dart';
import 'package:four_writers/screens/home/home_screen.dart';
import 'package:four_writers/screens/login/widgets/form_container.dart';
import 'package:four_writers/screens/login/widgets/sign_up_button.dart';
import 'package:four_writers/screens/login/widgets/stagger_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
// import 'signup_screen.dart';
// import 'login_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  // final _loginBlock = LoginBlock();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
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
                    SignUpButton(),
                  ],
                ),
                // StaggerAnimation(
                //   controller: _animationController.view,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
