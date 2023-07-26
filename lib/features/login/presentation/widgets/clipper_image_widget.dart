import 'package:flutter/material.dart';
import 'clipper_path.dart';

Widget buildBackgroundClipper ({required double screenHeight, required double screenWidth}){
  return
    ClipPath(
      clipper: ClipperPath(),
      child: Container(
        height: screenHeight * 0.5,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: Colors.cyan,
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