import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_stem/core/custom_widgets/text_field_widget.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../../data/model/login_user_model.dart';
import '../cubit/login_cubit.dart';

class LoginBox extends StatelessWidget {
  LoginBox({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUI.screenWidth,
      height: ResponsiveUI.screenHeight,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.black12)),
              margin: const EdgeInsets.only(top: 150),
              width: ResponsiveUI.screenWidth! * 0.9,
              height: ResponsiveUI.screenHeight! * 0.35,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Image.asset('images/neuro_logo.png')), //IMAGE
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
                      changeIconSuffix:
                          LoginCubit.get(context).getIsVisiblePass,
                      onPressVisiblePass: () {
                        LoginCubit.get(context).setIsVisiblePass =
                            !LoginCubit.get(context).getIsVisiblePass;
                        log(LoginCubit.get(context)
                            .getIsVisiblePass
                            .toString());
                      },
                    );
                  }
                }), //PASSWORD
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (BuildContext context, LoginState state) {
                    return State is LoginDataUserLoading
                        ? //change state to be circular loading
                        const CircularProgressIndicator()
                        : Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ResponsiveUI.screenWidth! * 0.15,
                                vertical: 15),
                            width: ResponsiveUI.screenWidth! * 0.5,
                            height: ResponsiveUI.screenHeight! * 0.05,
                            child: ElevatedButton(
                              onPressed: () {
                                LoginCubit.get(context).userLogin(
                                    LoginDataModel(
                                        username: usernameController.text,
                                        password: passwordController.text),
                                    context);
                                /*  if(state is LoginDataUserLoaded){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HomePage()));
                          }*/
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF90CAF9))),
                              child: const Text('LOGIN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(1, 1),
                                            color: Colors.blue),
                                      ])),
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
