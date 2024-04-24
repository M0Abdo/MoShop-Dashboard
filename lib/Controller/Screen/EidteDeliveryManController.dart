// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/deliveryman.dart';
import '../uploadeImage.dart';
import 'DeliveryManController.dart';

class EditeFeliveryManController extends GetxController {
  Map DeliveryMan = {};
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

  updataDeliveryMan() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        statusRequest = StatusRequest.loading;
        update();
        var res = await logInData.updata(
            textController[0].text,
            textController[1].text,
            textController[2].text,
            textController[3].text,
            textController[4].text,
            textController[5].text,
            DeliveryMan["delivery_id"],
            DeliveryMan["delivery_img"]);

        statusRequest = handleData(res);
        if (statusRequest == StatusRequest.success) {
          if (res['status'] == "success") {
            deliveryManController.getDateInApp();
            Get.back();
          } else {}
        }

        update();
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var res = await logInData.updataImg(
            textController[0].text,
            textController[1].text,
            textController[2].text,
            textController[3].text,
            textController[4].text,
            textController[5].text,
            DeliveryMan["delivery_id"],
            DeliveryMan["delivery_img"],
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

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    DeliveryMan = await Get.arguments;
    textController[0].text = DeliveryMan["delivery_name"];
    textController[1].text = DeliveryMan["delivery_email"];
    textController[2].text = DeliveryMan["delivery_pass"];
    textController[3].text = DeliveryMan["delivery_phone"];
    textController[4].text = DeliveryMan["delivery_address"];
    textController[5].text = DeliveryMan["delivery_national_number"];

    statusRequest = StatusRequest.success;
    update();
  }

  @override
  Future<void> onInit() async {
    getData();
    super.onInit();
  }
}
