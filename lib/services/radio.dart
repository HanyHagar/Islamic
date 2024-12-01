import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:islamic_app/models/readio_model.dart';
class RadioService{
  final Dio dio ;

  RadioService({required this.dio});

  Future<List<RadioModel>> getSound(bool lang) async {
    try {
      String language = lang ? 'ar':'eng';
      Response response = await dio.get(
          'https://mp3quran.net/api/v3/radios?language=$language'
      );
      Map<String,dynamic> jsonData = response.data;
      List radios = jsonData['radios'];
      List<RadioModel> radiosData = [];
      for(var radio in radios)
      {
        radiosData.add(RadioModel.jsonData(radio));
      }
      return radiosData;

    } on DioException catch (e) {
      log('Dio Exception :${e.toString()}');
      rethrow;
    } catch (e) {
      log('Exception :${e.toString()}');
      rethrow;
    }

  }
}


