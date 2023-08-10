import 'dart:convert';
import 'package:http/http.dart' as http;

import 'languagemodel.dart';

class LanguApi {
  static Future<LanguageModel> fetchLanguages() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/language-data/ar');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final languageModel = LanguageModel.fromJson(json.decode(response.body));

      print(response.body.toString());

      return languageModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
