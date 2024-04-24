// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/services.dart';

class changeLocal extends GetxController {
  Locale? MyLang;
  MyServices myServices = Get.find();
  changLang(String My) {
    Locale locale = Locale(My);
    myServices.sharedPreferences.setString("lang", My);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    if (myServices.sharedPreferences.getString("lang") == "ar") {
      
      MyLang = const Locale("ar");
    }else if (myServices.sharedPreferences.getString("lang") == "en") {
      MyLang = const Locale("en");
    }else {
      MyLang =  Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
