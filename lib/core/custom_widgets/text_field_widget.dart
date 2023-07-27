import 'package:flutter/material.dart';

import '../../features/login/presentation/cubit/login_cubit.dart';
import '../utilities/responsive_ui.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.isPassword,
      required this.controller,
      this.onPressVisiblePass,
      this.changeIconSuffix});
  final String title;
  final bool isPassword;
  final bool? changeIconSuffix;
  final TextEditingController controller;
  final VoidCallback? onPressVisiblePass;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveUI.screenWidth! * 0.8,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffix: isPassword
              ? IconButton(
                  icon: Icon(changeIconSuffix ?? false
                      ? Icons.remove_red_eye
                      : Icons.visibility_off),
                  onPressed: onPressVisiblePass)
              : const SizedBox(),
          labelText: title,
          labelStyle: TextStyle(
            color: Colors.blueAccent,
            fontSize: ResponsiveUI.screenWidth! * 0.04,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
        ),
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 17,
        ),
        obscureText: LoginCubit.get(context).getIsVisiblePass,
        textInputAction:
            isPassword ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }
}
