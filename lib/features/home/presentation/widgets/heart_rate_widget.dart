import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../cubit/home_cubit.dart';

class HeartRate extends StatelessWidget {
  const HeartRate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
      TimerSetter(4, context);
      // log(CacheHelper.getData(key: BPM_RATE).toString());
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 70),
            height: 100,
            width: ResponsiveUI.screenWidth! * 0.9,
            child: Text(
              'Heart rate records ',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
            ),
          ),
          Card(
            shadowColor: Colors.blue.shade900,
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              height: ResponsiveUI.screenHeight! * 0.3,
              width: ResponsiveUI.screenWidth! * 0.8,
              child: AspectRatio(
                aspectRatio: 1,
                child: LineChart(
                  LineChartData(
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                            spots: <FlSpot>[
                              FlSpot(DateTime.now().minute.toDouble(), 65),
                              FlSpot(
                                  calculateTimeInPast(timeDifference: 10), 73),
                              FlSpot(
                                  calculateTimeInPast(timeDifference: 20), 66),
                              FlSpot(
                                  calculateTimeInPast(timeDifference: 30), 65),
                              FlSpot(
                                  calculateTimeInPast(timeDifference: 40), 66),
                              FlSpot(
                                  calculateTimeInPast(timeDifference: 50), 69),
                              FlSpot(
                                  calculateTimeInPast(timeDifference: 60), 75),
                            ],
                            belowBarData: BarAreaData(
                                color: Colors.blue.shade50, show: true),
                            curveSmoothness: 0.3,
                            dotData: const FlDotData(show: false),
                            color: Colors.lightBlueAccent),
                      ],
                      minY: 50,
                      maxX: 60,
                      titlesData: const FlTitlesData(
                          topTitles: AxisTitles(
                            axisNameSize: 30,
                            axisNameWidget: Text(
                              'Average bpm',
                            ),
                          ),
                          rightTitles: AxisTitles())),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

double calculateTimeInPast({double timeDifference = 0}) {
  double timeInPast = DateTime.now().minute.toDouble() - timeDifference;
  if (timeInPast < 0) {
    timeInPast = 0;
  }
  return timeInPast;
}

TimerSetter(int duration, BuildContext context) {
  Timer(Duration(seconds: duration), () => HomeCubit.get(context).getBpmRatio);
}
