import 'package:breathing_collection/breathing_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../cubit/home_cubit.dart';

class StressRate extends StatelessWidget {
  const StressRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(25),
        color: Colors.transparent,
        shadowColor: Colors.grey.shade50,
        elevation: 30,
        child: BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, HomeState state) {
          final bool val = HomeCubit.get(context).getIsStress;
          return InkWell(
            onTap: () async {
              final PermissionStatus status =
                  await Permission.notification.status;
              if (status.isDenied || status.isRestricted) {
                openAppSettings(); // Opens the app settings where user can enable notifications
              }
              await Future.delayed(const Duration(seconds: 1));
              if (!context.mounted) {}
              HomeCubit.get(context).setIsStress =
                  !HomeCubit.get(context).getIsStress;
            },
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    BreathingGlowingButton(
                        height: 100.0,
                        width: 100.0,
                        buttonBackgroundColor: Colors.white,
                        glowColor: val ? Colors.red : Colors.green),
                    if (val)
                      const Icon(Icons.warning_amber_outlined,
                          color: Colors.red, size: 60)
                    else
                      const Icon(Icons.check, color: Colors.green, size: 60),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  val ? 'Stressed' : 'Relaxed',
                  style: TextStyle(
                      fontSize: 20,
                      color: val ? Colors.red.shade900 : Colors.green),
                ),
              ],
            ),
          );
        }));
  }

  Future<void> checkAndRequestNotificationPermission() async {
    final PermissionStatus status = await Permission.notification.status;

    if (status.isDenied) {
      await Permission.notification.request();
    }
    {
      await Permission.accessNotificationPolicy.request();
      await Permission.notification.request();
    }
  }
}
