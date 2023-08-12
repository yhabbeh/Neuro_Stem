import 'dart:math' hide log;

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  double get getBpmRatio {
    final double currentBpm = Random().nextInt(80) * 1.0;
    return currentBpm;
  }

  bool get getStressLevel {
    final bool stressLevel = Random().nextBool();
    return stressLevel;
  }
}
