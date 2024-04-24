// ignore_for_file: file_names

import 'package:get/get.dart';

import '../Services/services.dart';

translateDatabase(ar, en) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
