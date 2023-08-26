import 'package:flutter/material.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../cubit/home_cubit.dart';

void customDialog({
  required BuildContext context,
}) {
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Colors.black26,
        builder: (BuildContext innerContext) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // backgroundColor: const Color(),
            scrollable: true,
            title: const Text(
                'Please Choose Which your Favorite Music You Are Like:'),
            content: SizedBox(
              height: ResponsiveUI.screenHeight! * 0.4,
              width: ResponsiveUI.screenWidth! * .7,
              child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ResponsiveUI.screenHeight! * 0.005),
                    child: InkWell(
                      onTap: () {
                        HomeCubit.get(context).typesOfMusic[index].onTap!();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: ResponsiveUI.screenHeight! * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(HomeCubit.get(context)
                                  .typesOfMusic[index]
                                  .imagePath),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            HomeCubit.get(context).typesOfMusic[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                // backgroundColor:
                                //     Colors.white54.withOpacity(0.4),
                                shadows: <Shadow>[Shadow(color: Colors.red)]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: HomeCubit.get(context).typesOfMusic.length,
              ),
            )));
  });
}
