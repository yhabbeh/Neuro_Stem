import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../cubit/home_cubit.dart';

class StressRate extends StatelessWidget {
  const StressRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: ResponsiveUI.screenWidth! * 0.8,
        color: Colors.blueGrey.shade50,
        child: Column(
          children: <Widget>[
            Text(
              'Stress Level',
              style: TextStyle(fontSize: 20, color: Colors.blue.shade900),
            ),
            Container(
              width: ResponsiveUI.screenWidth! * 0.7,
              color: Colors.transparent,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (BuildContext context, HomeState state) {
                  int val = HomeCubit.get(context).getStressLevel;
                  return StepProgressIndicator(
                    totalSteps: 10,
                    currentStep: val,
                    selectedSize: 22,
                    selectedColor: val < 5
                        ? Colors.blue.shade900
                        : val < 8
                            ? Colors.orange.shade900
                            : Colors.red.shade900,
                    blendMode: BlendMode.colorBurn,
                    customSize: (int index, bool b) => (index + 1) * 10.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
