// ignore_for_file: file_names

import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/ads.dart';
import '../uploadeImage.dart';
import 'AdsController.dart';

class AddAdsController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<SelectedListItem> dataBox = [];
  AdsController adsController = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  Map itemToId = {};
  List<String> titles = [
    "Ads Title",
    "Ads Title (arbic)",
    "Ads Content",
    "Ads Content (arbic)"
  ];
  changeCheck() {
    update();
  }

  addImg() async {
    file = await uploadImage();
    update();
  }

  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.items();
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        for (var i = 0; i < res["data"].length; i++) {
          itemToId["${res["data"][i]["items_name"]} - ${res["data"][i]["categories_name"]}"] =
              "${res["data"][i]["items_id"]}";
          dataBox
              .add(SelectedListItem(name: "${res["data"][i]["items_name"]} - ${res["data"][i]["categories_name"]}"));
        }
      } else {}
    }

    update();
  }

  AdsData logInData = AdsData(Get.find());
  addCatagore() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.add(
          textController[0].text,
          textController[1].text,
          textController[2].text,
          textController[3].text,
          itemToId[textController[4].text.toString()],
          file!);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          adsController.getDateInApp();
          Get.back();
        } else {}
      }

      update();
    }
  }

  @override
  void onInit() {
    getDateInApp();
    super.onInit();
  }
}
