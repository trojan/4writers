import 'package:flutter/material.dart';
import 'package:four_writers/screens/home/tabs/widgets/list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Teste",
          image: AssetImage("images/user.png"),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: "Teste",
          image: AssetImage("images/user.png"),
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}
