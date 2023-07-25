import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neuro_stem/features/login/presentation/widgets/clipper_path.dart';
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
      body: Stack(children: [
        Container(width: screenWidth,height: screenHeight,color: Colors.black12 ,),
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
                  'images/3647100.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
        SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top :50),
                  width: 150,
                  height: 150,
                  decoration:   const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.white ,
                      ),
                  child: Image.asset( 'images/neuro_logo.png')),
              customTextField(
                  screenWidth: screenWidth, title: "USERNAME", isPass: false),
              customTextField(
                  screenWidth: screenWidth, title: "PASSWORD", isPass: true),
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
                            Shadow(offset: Offset(1, 1), color: Colors.blue),
                          ])),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
