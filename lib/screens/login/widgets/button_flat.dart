import 'package:flutter/material.dart';

class ButtonFlat extends StatelessWidget {
  final String hint;

  ButtonFlat({@required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 80,
      ),
      child: Text(
        hint,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
