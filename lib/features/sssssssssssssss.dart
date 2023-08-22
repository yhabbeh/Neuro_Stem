import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/local_lang_cubit.dart';
import '../core/cubit/local_lang_state.dart';
import '../core/platform/app_local.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LocalCubit, LocalState>(builder: (context, state) {
            if (state is ChangeLocalState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<LocalCubit>(context)
                            .changeLanguage('en');
                      },
                      child: Text(
                        'en',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<LocalCubit>(context)
                            .changeLanguage('ar');
                      },
                      child: Text(
                        'ar',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      )),
                ],
              );
            }
            return SizedBox();
          }),
          Center(
            child: Text(
              "PASSWORD".tr(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}
