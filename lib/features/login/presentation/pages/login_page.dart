import 'package:flutter/material.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../widgets/clipper_image_widget.dart';
import '../widgets/login_box_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: ResponsiveUI.screenWidth,
          height: ResponsiveUI.screenHeight,
          color: Colors.black12,
        ),
        const BuildBackgroundClipper(),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black12)),
            margin: const EdgeInsets.only(top: 160),
            width: ResponsiveUI.screenWidth! * 0.9,
            height: ResponsiveUI.screenHeight! * 0.35,
          ),
        ),
        LoginBox()
      ]),
    );
  }
}
