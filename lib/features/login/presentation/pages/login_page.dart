import 'package:flutter/material.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../widgets/clipper_image_widget.dart';
import '../widgets/login_box_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            width: ResponsiveUI.screenWidth,
            height: ResponsiveUI.screenHeight,
            color: Colors.black12,
          ),
          const BuildBackgroundClipper(),
          LoginBox()
        ]),
      ),
    );
  }
}
