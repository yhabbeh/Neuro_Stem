import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: ListView(
            dragStartBehavior: DragStartBehavior.down,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                   child: Image.asset('neuro_logo.png')
                  ),
                ),
              customTextField(
                  screenWidth: screenWidth, title: 'Username', isPass: false),
              customTextField(
                  screenWidth: screenWidth, title: 'Password', isPass: true),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.2, vertical: 10),
                width: screenWidth * 0.4,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF90CAF9))),
                  child: Text("login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
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
