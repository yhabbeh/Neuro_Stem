import 'package:flutter/material.dart';
import '../widgets/clipper_image_widget.dart';
import '../widgets/login_box_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(width: screenWidth,height: screenHeight,color: Colors.black12 ,),
        buildBackgroundClipper(screenHeight: screenHeight,screenWidth: screenWidth),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black12)),
            margin: const EdgeInsets.only(top: 160),
            width: screenWidth * 0.9,
            height: screenHeight * 0.35,
          ),
        ),
        loginBox(screenWidth: screenWidth,screenHeight: screenHeight)
      ]),
    );
  }
}
