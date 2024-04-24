// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/deliverycost.dart';
import '../uploadeImage.dart';
import 'DeliveyCostController.dart';

class EditeDeliveyCostController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  Map Cat = {};
  DeliveyCostController catagresController = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  List<String> titles = ["City Name", "City Name (arbic)","Cost"];
  addImg() async {
    file = await uploadImage(true);
    update();
  }

  DeliveryCostData logInData = DeliveryCostData(Get.find());
  eidteCatagore() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.updata(Cat["delivery_id"],
          textController[0].text, textController[1].text,textController[2].text);
     
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          catagresController.getDateInApp();
          Get.back();
        } else {}
      }

      update();
    }else {
 statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.updata(Cat["categories_id"],
          textController[0].text, textController[1].text,Cat["categories_image"]);
 
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          catagresController.getDateInApp();
          Get.back();
        } else {}
      }

      update();
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    Cat = await Get.arguments;
    textController[0].text = Cat["delivery_city"];
    textController[1].text = Cat["delivery_city_ar"];
    textController[2].text = Cat["delivery_cost"];
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  Future<void> onInit() async {
    getData();
    super.onInit();
  }
}
