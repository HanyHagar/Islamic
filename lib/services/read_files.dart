import 'package:flutter/services.dart';

class ReadFiles{
  Future<String> readFile( location) async {
    try {
      final contents = await rootBundle.loadString('assets/surahs/islami files/files/$location');
      return contents;
    } catch (e) {
      rethrow;

    }
  }
}