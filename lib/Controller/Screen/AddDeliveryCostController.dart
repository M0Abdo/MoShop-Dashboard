
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/deliverycost.dart';
import 'DeliveyCostController.dart';

class AddDeliveryCostController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  
  DeliveyCostController  deliveyCostController = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  
  List<String> titles = ["City Name", "City Name (arbic)","Cost"];
 

  DeliveryCostData logInData = DeliveryCostData(Get.find());
  addCatagore() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.add(
          textController[0].text, textController[1].text,textController[2].text );
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          deliveyCostController.getDateInApp();
          Get.back();
        } else {}
      }

      update();
    }
  }
}
