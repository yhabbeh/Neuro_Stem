import 'dart:math' hide log;

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/model/type_of_music_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  double get getBpmRatio {
    final double currentBpm = Random().nextInt(80) * 1.0;
    return currentBpm;
  }

  int get getStressLevel {
    final int stressLevel = Random().nextInt(10);
    return stressLevel;
  }

  List<TypeOfModel> typesOfMusic = [
    TypeOfModel(
        title: 'National Music',
        id: 1,
        imagePath: 'images/national_image.png',
        onTap: () async {
          final AudioPlayer player = AudioPlayer(); // Create a player
          await player.setAsset('assets/example.mp3');
          await player.play();
        }),
    TypeOfModel(
        title: 'Sea Music', id: 2, imagePath: 'images/sea.png', onTap: () {}),
    TypeOfModel(
        title: 'Rain Music', id: 3, imagePath: 'images/rains.png', onTap: () {})
  ];
}
