// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/catagres.dart';
import '../uploadeImage.dart';
import 'CatagresController.dart';

class EditeCatagoreController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
  ];
  Map Cat = {};
  CatagresController catagresController = Get.put(CatagresController());
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  List<String> titles = ["Catagore Name", "Catagore Name (arbic)"];
  addImg() async {
    file = await uploadImage(true);
    update();
  }

  CatagresData logInData = CatagresData(Get.find());
  eidteCatagore() async {
    if (formstate.currentState!.validate()) {
       if(file!=null)
      {statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.updataImg(Cat["categories_id"],
          textController[0].text, textController[1].text,Cat["categories_image"], file!);
    
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          catagresController.getDateInApp();
          Get.back();
        } else {}
      }

      update();}
      else {
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
    }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    Cat = await Get.arguments;
    textController[0].text = Cat["categories_name"];
    textController[1].text = Cat["categories_arabic"];
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  Future<void> onInit() async {
    getData();
    super.onInit();
  }
}
