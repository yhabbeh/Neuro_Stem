import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../cubit/home_cubit.dart';

class EdaWidget extends StatelessWidget {
  const EdaWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    double val = HomeCubit.get(context).getBpmRatio;
    return Card(
      margin: const EdgeInsets.all(20),
      color: Colors.transparent,
      elevation: 10,
      shadowColor: Colors.blueGrey,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: ResponsiveUI.screenWidth! * 0.3,
        height: ResponsiveUI.screenHeight! * 0.25,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
            borderRadius: const BorderRadius.all(Radius.circular(20))),

        // color: Colors.red,
        child: CircularPercentIndicator(
          radius: ResponsiveUI.screenWidth! * 0.12,
          percent: val * 0.01,
          arcType: ArcType.FULL,
          center: Text('${val}%'),
          footer: Text(rateEDA(val)),
          header: Text(title),
          lineWidth: 10,
          // fillColor: Colors.blueGrey.shade100,
          curve: Curves.easeInOutBack,
          reverse: true,
          animationDuration: 1000,
          animation: true,
          restartAnimation: true,
          progressColor: Colors.blueAccent,
          arcBackgroundColor: Colors.red.shade200,
        ),
      ),
    );
  }
}

String rateEDA(double v) {
  log((v / 30).ceil().toString());
  switch ((v / 30).ceil()) {
    case 3:
      return 'Height';
    case 2:
      return 'Normal';
    case 1 || 0:
      return 'Low';
    default:
      return 'Empty';
  }
}
