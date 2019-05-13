import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final EdgeInsets margin;

  ListData({this.title, this.image, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1.0),
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: image),
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
