import 'package:flutter/material.dart';

import '../../../../core/utilities/responsive_ui.dart';
import 'clipper_path.dart';

class BuildBackgroundClipper extends StatelessWidget {
  const BuildBackgroundClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperPath(),
      child: Container(
        height: ResponsiveUI.screenHeight! * 0.5,
        width: ResponsiveUI.screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            matchTextDirection: true,
            image: AssetImage(
              'images/10316.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
