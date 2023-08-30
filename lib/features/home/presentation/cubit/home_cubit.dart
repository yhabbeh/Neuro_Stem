import 'dart:developer';
import 'dart:math' hide log;

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/utilities/notification_utiities.dart';
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

  bool _stressLevel = false;

  bool get getIsStress => _stressLevel;

  set setIsStress(bool value) {
    emit(StressLevelLoading());
    _stressLevel = value;
    if (value) {
      Future<void>.delayed(
        const Duration(seconds: 1),
        () => NotificationUtilities.showBigTextNotification(
            id: '0',
            title: 'Stress detected',
            body: 'please connect (Neurosky Mindwave EEG) Device.',
            payload: 'please connect (Neurosky Mindwave EEG) Device'),
      );
    } else {
      audioPlayer.stop();
    }
    emit(StressLevelLoaded());
  }

  List<TypeOfModel> typesOfMusic = [
    TypeOfModel(
        title: 'Nature',
        id: 1,
        imagePath: 'images/national_image.png',
        onTap: () async {
          tempPath = 'nature.mp3';
          audioPlayer.play(AssetSource(tempPath));
          await Future.delayed(Duration(seconds: 10));
          audioPlayer.stop();
        }),
    TypeOfModel(
        title: 'Sea',
        id: 2,
        imagePath: 'images/sea.png',
        onTap: () async {
          tempPath = 'sea.mp3';
          log(tempPath);
          audioPlayer.play(AssetSource(tempPath));
          await Future.delayed(const Duration(seconds: 10));
          audioPlayer.stop();
        }),
    TypeOfModel(
        title: 'Rain',
        id: 3,
        imagePath: 'images/rains.png',
        onTap: () async {
          tempPath = 'rain.mp3';
          audioPlayer.play(AssetSource(tempPath));
          await Future.delayed(const Duration(seconds: 10));
          audioPlayer.stop();
        })
  ];
}
