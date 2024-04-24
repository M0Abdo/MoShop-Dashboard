// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/catagres.dart';
import '../uploadeImage.dart';
import 'CatagresController.dart';

class AddCatagoreController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
  ];
  CatagresController catagresController = Get.put( CatagresController());
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  List<String> titles = ["Catagore Name", "Catagore Name (arbic)"];
  addImg() async {
    file = await uploadImage(true);
    update();
  }

  CatagresData logInData = CatagresData(Get.find());
  addCatagore() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.add(
          textController[0].text, textController[1].text, file!);
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
