// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/deliveryman.dart';
import '../uploadeImage.dart';
import 'DeliveryManController.dart';

class AddDeliveryManController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  DeliveryManController deliveryManController = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  List<String> titles = [
    "Name",
    "Username",
    "Password",
    "Phone",
    "Address",
    "National Id"
  ];
  addImg() async {
    file = await uploadImage();
    update();
  }

  DeliveryManData logInData = DeliveryManData(Get.find());
  addDeliveryMan() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.add(
          textController[0].text,
          textController[1].text,
          textController[2].text,
          textController[3].text,
          textController[4].text,
          textController[5].text,
          file!);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          deliveryManController.getDateInApp();
          Get.back();
        } else {}
      }

      update();
    }
  }
}
