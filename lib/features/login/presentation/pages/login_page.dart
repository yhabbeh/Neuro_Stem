import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/EnglishStrings.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // late TextEditingController passwordController;
  // late TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  'images/neuro_logo.png',
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
                ),
              ),
              customTextField(
                  screenWidth: screenWidth,
                  title: "USERNAME",
                  isPass: false),
              customTextField(
                  screenWidth: screenWidth,
                  title: "PASSWORD",
                  isPass: true),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15, vertical: 15),
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF90CAF9))),
                  child: Text("LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.06,
                          shadows: const [
                          Shadow( offset: Offset(1, 1),
                      color: Colors.blue
                  ),]
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
