import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'coursemodel.dart';
import 'coursenetwork.dart';

class CourseController extends GetxController {
  @override
  void onInit() {
    fetchAllusers();
    super.onInit();
  }

  var isLoading = false.obs;

  var allcourses = CoursesModel().obs;

  Future<void> fetchAllusers() async {
    try {
      isLoading(true);
      var allcourse = await CourseAPi.fetchCourses().then((value) {
        allcourses.value = value;
        print(allcourses);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
