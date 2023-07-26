import 'package:flutter/material.dart';
import 'text_field_widget.dart';

Widget loginBox({required double screenHeight, required double screenWidth}){
  return
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
              screenWidth: screenWidth, title: 'USERNAME', isPass: false),
          customTextField(
              screenWidth: screenWidth, title: 'PASSWORD', isPass: true),
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
              child: Text('LOGIN',
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
      ));

}