import 'dart:convert';
import 'package:flutter_localization_ex/course/languages/lan_network.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'languagemodel.dart';

class LanguController extends GetxController {
  @override
  void onInit() {
    fetchFinalData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allLanguages = LanguageModel().obs;

  Future<void> fetchFinalData() async {
    try {
      isLoading(true);
      var languages = await LanguApi.fetchLanguages().then((value) {
        allLanguages.value = value;
        print(allLanguages);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
