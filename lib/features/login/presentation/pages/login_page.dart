import 'package:flutter/material.dart';
import 'package:neuro_stem/features/login/presentation/widgets/clipper_path.dart';
import '../widgets/clipper_image_widget.dart';
import '../widgets/login_box_widget.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(width: screenWidth,height: screenHeight,color: Colors.black12 ,),
        buildBackgroundClipper(screenHeight: screenHeight,screenWidth: screenWidth),
        loginBox(screenWidth: screenWidth,screenHeight: screenHeight)
      ]),
    );
  }
}
