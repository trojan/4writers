import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:four_writers/screens/home/tabs/stories.dart';

import 'package:four_writers/screens/home/widgets/stagger_animation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: Duration(microseconds: 500), curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Conta"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storage),
              title: Text("Histórias"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Generos"),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: <Widget>[
            Stories(),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/teste.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("1"),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/teste.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("1"),
            ),
          ],
        ));
  }
}
