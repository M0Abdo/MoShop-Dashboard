// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Data/Remote/login.dart';
import '../AppRoute.dart';

class LogInController extends GetxController {
  TextEditingController? emailControler = TextEditingController();
  TextEditingController? passControler = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  LogInData logInData = LogInData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.postdata(
        emailControler?.text ?? '', passControler?.text ?? '');

    statusRequest = handleData(res);
    print(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        myServices.sharedPreferences
            .setString("id", "${res['data']?['admin_id']}");
        myServices.sharedPreferences
            .setString("username", "${res['data']?['admin_username']}");
        myServices.sharedPreferences
            .setString("manger", "${res['data']?['manger']}");
        myServices.sharedPreferences.setString("check", "1");

        Get.offAllNamed(AppRoute.home);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email or Password is Wrong",
        );
      }
    }
    update();
  }

  bool f = false;
  SeeHied() {
    f = !f;
    update();
  }

  GoToSingIn() {
    var formst = formstate.currentState;
    if (formst!.validate()) {
      getDateInApp();
    } else {
      // Handle form validation failure
    }
  }
}
