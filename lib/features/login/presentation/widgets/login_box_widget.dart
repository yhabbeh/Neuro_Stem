import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_stem/core/custom_widgets/text_field_widget.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../cubit/login_cubit.dart';

class LoginBox extends StatelessWidget {
  LoginBox({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ResponsiveUI.screenWidth,
        height: ResponsiveUI.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 50),
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.white,
                ),
                child: Image.asset('images/neuro_logo.png')),
            CustomTextField(
              title: 'USERNAME',
              isPassword: false,
              controller: usernameController,
            ),
            BlocBuilder<LoginCubit, LoginState>(
                builder: (BuildContext context, LoginState state) {
              if (state is IsVisiblePasswordLoading) {
                return Container();
              } else {
                return CustomTextField(
                  title: 'PASSWORD',
                  isPassword: true,
                  controller: passwordController,
                  changeIconSuffix: LoginCubit.get(context).getIsVisiblePass,
                  onPressVisiblePass: () {
                    LoginCubit.get(context).setIsVisiblePass =
                        !LoginCubit.get(context).getIsVisiblePass;
                    log(LoginCubit.get(context).getIsVisiblePass.toString());
                  },
                );
              }
            }),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ResponsiveUI.screenWidth! * 0.15, vertical: 15),
              width: ResponsiveUI.screenWidth! * 0.5,
              height: ResponsiveUI.screenHeight! * 0.05,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF90CAF9))),
                child: const Text('LOGIN',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontSize: 18, shadows: [
                      Shadow(offset: Offset(1, 1), color: Colors.blue),
                    ])),
              ),
            )
          ],
        ));
  }
}
