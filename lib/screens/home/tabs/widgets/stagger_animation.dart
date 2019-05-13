import 'package:flutter/material.dart';
import 'package:four_writers/screens/home/tabs/widgets/animated_list_view.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({@required this.controller})
      : listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(bottom: 80),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.325,
              0.8,
              curve: Curves.ease,
            ),
          ),
        );

  final Animation<EdgeInsets> listSlidePosition;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        AnimatedListView(
          listSlidePosition: listSlidePosition,
        )
      ],
    );
  }
}
