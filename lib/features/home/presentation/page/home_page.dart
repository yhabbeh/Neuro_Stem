import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utilities/notification_utiities.dart';
import '../widgets/EDA_rate.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/heart_rate_widget.dart';
import '../widgets/stress_level.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    NotificationUtilities.initialize(context);
    NotificationUtilities.requestPermissions();
    customDialog(context: context);
    checkAndRequestNotificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text('Neuro Stem ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.gluten(
                    textStyle:
                        const TextStyle(fontSize: 35, color: Colors.blue),
                  ))),
          body: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const SingleChildScrollView(
              primary: false,
              child: Column(
                children: <Widget>[
                  HeartRate(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      EdaWidget(title: 'EDA Rate'),
                      EdaWidget(
                        title: '%SpO2',
                      ),
                    ],
                  ),
                  StressRate(),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> checkAndRequestNotificationPermission() async {
    final PermissionStatus status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    } else if (status.isRestricted) {
      await Permission.notification.request();
      await Permission.accessNotificationPolicy.request();
    } else if (status.isPermanentlyDenied) {
      await Permission.accessNotificationPolicy.request();
      await Permission.notification.request();
    }
  }
}
