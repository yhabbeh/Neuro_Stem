import 'package:flutter/material.dart';

Widget customTextField({required double screenWidth, required bool isPass, required String title , }){
  return SizedBox(
    width: screenWidth * 0.8,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(
          color: Colors.blueAccent,
          fontSize: screenWidth * 0.04,
        ),focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey, width: 1.0)),
      ),
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 17,
      ),
      obscureText: isPass,
      textInputAction: isPass?TextInputAction.done:TextInputAction.next,
    ),
  ) ;
}