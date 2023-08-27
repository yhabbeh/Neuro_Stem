import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neuro_stem/features/login/presentation/pages/login_page.dart';

import '../core/utilities/responsive_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          height: ResponsiveUI.screenHeight,
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
        Center(
          child: Container(
              padding: const EdgeInsets.all(30),
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(120)),
                color: Colors.white,
              ),
              child: Image.asset('images/neuro_logo.png')),
        ),
      ]),
    );
  }
}
