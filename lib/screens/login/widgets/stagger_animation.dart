// import 'package:flutter/material.dart';
// import 'package:four_writers/blocks/login_block.dart';

// class StaggerAnimation extends StatelessWidget {
//   final AnimationController controller;

//   StaggerAnimation({this.controller})
//       : buttonSqueeze = Tween(
//           begin: 320.0,
//           end: 60.0,
//         ).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Interval(0.0, 0.150),
//           ),
//         ),
//         buttonZoomOut = Tween(
//           begin: 60.0,
//           end: 1000.0,
//         ).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Interval(0.5, 1, curve: Curves.bounceOut),
//           ),
//         );

//   final Animation<double> buttonSqueeze;
//   final Animation<double> buttonZoomOut;
//   final _loginBlock = LoginBlock();

//   Widget _builAnimation(BuildContext context, Widget child) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 50),
//       child: StreamBuilder<bool>(
//           stream: _loginBlock.outSubmitValid,
//           builder: (context, snapshot) {
//             return InkWell(
//               onTap: () {},
//               child: buttonZoomOut.value <= 60
//                   ? Container(
//                       width: buttonSqueeze.value,
//                       height: 60,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(0, 105, 92, 1.0),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(30.0),
//                         ),
//                       ),
//                       child: _buildInside(context),
//                     )
//                   : Container(
//                       width: buttonZoomOut.value,
//                       height: buttonZoomOut.value,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(0, 105, 92, 1.0),
//                         shape: buttonZoomOut.value < 500
//                             ? BoxShape.circle
//                             : BoxShape.rectangle,
//                       ),
//                     ),
//             );
//           }),
//     );
//   }

//   Widget _buildInside(BuildContext context) {
//     if (buttonSqueeze.value > 75) {
//       return Text(
//         "Entrar",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.w300,
//           letterSpacing: 0.3,
//         ),
//       );
//     } else {
//       return CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//         strokeWidth: 1.0,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       builder: _builAnimation,
//       animation: controller,
//     );
//   }
// }
