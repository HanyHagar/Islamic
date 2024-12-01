// ignore_for_file: invalid_return_type_for_catch_error

import 'dart:async';
import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/models/hadith_model.dart';
import 'package:islamic_app/models/readio_model.dart';
import 'package:islamic_app/services/radio.dart';
import 'package:islamic_app/services/read_files.dart';
import 'statues.dart';
class AppCubit extends Cubit<AppStates>{
AppCubit() : super(InitialState());
 static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
final player = AudioPlayer();  // Declare it outside the function to reuse the instance
bool isLight = false;
bool isArabic = false;
int currentScreen = 2;
int tasbeehCounter = 0;
int tasbeehValue = 33;
List<String> dropdownItems = ['33', '99'];
Color selectBottomItemAppBar = const Color(0xFFFACC1D);
Color unSelectBottomItemAppBar = const Color(0xFFF8F8F8);
int currentChanelRadio = 0;
List<RadioModel> radioChannels = [];
bool isPlaying = false;
Future<void> changeScreen(index) async {
  currentScreen = index;
  log('currentBadge = $currentScreen');
  if (player.state == PlayerState.playing) {
    await player.stop().then((onValue){
      isPlaying = false;
    });
  }
  emit(ChangeScreenState());
 }
void changeTasbeehCounter(){
  if(tasbeehCounter<tasbeehValue)
    {
      log("tasbeehValue $tasbeehValue");
      log("tasbeehCounter $tasbeehCounter");
      tasbeehCounter++;
      emit(ChangeNumberOfTasbeehBadgeState());
    }
  else
    {
      resetTasbeehCounter();
    }

 }
void resetTasbeehCounter(){
  tasbeehCounter = 0;
  emit(ResetNumberOfTasbeehBadgeState());
}
void changeTasbeehValueState(value){
  tasbeehValue = value;
  emit(ChangeTasbeehValueState());
}
void changeMode(){
  isLight = !isLight;
  emit(ChangeModeState());
}
void changeLang(){
  isArabic = !isArabic;
  emit(ChangeLanguageState());
}
Future<void> getRadio() async {
  emit(LoadingRadioState());
  RadioService(dio: Dio()).getSound(isArabic).then((value) {
    radioChannels = value;
    emit(SuccessRadioState(value));
  }).catchError((onError) {
    emit(FailedRadioState(error: onError.toString()));
  });
}
Future<void> radioFunctions(String func) async {
  if (func == 'next') {
    if (currentChanelRadio < radioChannels.length - 1) {
      await player.stop().then((value) {
        isPlaying = false;
        emit(ChangeRadioChannelState());
      });
      currentChanelRadio++;
      log('Current channel: $currentChanelRadio');
      await player.play(UrlSource(radioChannels[currentChanelRadio].url)).then((value) {
        isPlaying = true;
        emit(ChangeRadioChannelState());
      });
    }
  }
  else if (func == 'previous') {
    if (currentChanelRadio > 0) {
      await player.stop().then((value) {
        isPlaying = false;
        emit(ChangeRadioChannelState());
      });
      currentChanelRadio--;
      log('Current channel: $currentChanelRadio');
      await player.play(UrlSource(radioChannels[currentChanelRadio].url)).then((value) {
        isPlaying = true;
        emit(ChangeRadioChannelState());
      });
    }
  } else if (func == 'play') {
    if (isPlaying) {
      await player.stop().then((value) {
        isPlaying = false;
        emit(ChangeRadioChannelState());
      });
    } else {
      await player.play(UrlSource(radioChannels[currentChanelRadio].url)).then((value) {
        isPlaying = true;
        emit(ChangeRadioChannelState());
      });
    }
  }
}
void getMoshafData(location) async {
  String moshaf = '';
  ReadFiles().readFile(location)
      .then((value) {
    List<String> lines = value.split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (i == 0) {
        // Skip adding the line number for the first line
        moshaf = '$moshaf${lines[i]}\n';
      } else {
        // Add the line number for all other lines
        moshaf = '$moshaf${lines[i]}($i)\n';
      }
    }
    emit(SuccessGetMoshafDataState(moshaf));
  })
      .catchError((onError) {
    emit(FailedGetMoshafDataState(error: onError));
  });
}
void getHadithData(String location){
  emit(LoadingGetHadithDataState());
  ReadFiles().readFile(location).then((value) {
    emit(SuccessGetHadithDataState(hadithData(value)));
  }
  ).catchError((onError){
    emit(FailedGetHadithDataState(error: onError));
  });
}
List<HadithModel> hadithData(String input) {
  List<HadithModel> hadith = [];
  String title = '';
  String details = '';
  List<String> lines = input.split('\n');
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].startsWith('#')) {
      if (title.isNotEmpty && details.isNotEmpty) {
        hadith.add(HadithModel(title: title, details: details));
        title = '';
        details = '';
      }
      else {
        continue;
      }
    }
    else {
      if (title.isEmpty) {
        title = lines[i].toString();
      }
      else {
        details = '$details\n${lines[i]}';
      }
    }
  }
  return hadith;
}
void showBottomSheet(GlobalKey<ScaffoldState> key , widget){
  key.currentState?.showBottomSheet((context) => widget,).closed;
  emit(ChangeBottomSheetState());
}
void hiddenBottomSheet(context){
  Navigator.pop(context);
  emit(ChangeBottomSheetState());
}

}
