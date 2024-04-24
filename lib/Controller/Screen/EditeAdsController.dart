// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:electronic_shop_dashboard/Data/Remote/ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../uploadeImage.dart';
import 'AdsController.dart';

class EditeAdsController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<SelectedListItem> dataBox = [];
  Map Cat = {};
  AdsController catagresController = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  Map itemToId = {}, idToItem = {};
  List<String> titles = [
    "Ads Title",
    "Ads Title (arbic)",
    "Ads Content",
    "Ads Content (arbic)"
  ];
  addImg() async {
    file = await uploadImage();
    update();
  }

  changeCheck() {
    update();
  }

  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.items();

    if (res['status'] == "success") {
      for (var i = 0; i < res["data"].length; i++) {
        itemToId[
                "${res["data"][i]["items_name"]} - ${res["data"][i]["categories_name"]}"] =
            "${res["data"][i]["items_id"]}";
        idToItem["${res["data"][i]["items_id"]}"] =
            "${res["data"][i]["items_name"]} - ${res["data"][i]["categories_name"]}";
        dataBox.add(SelectedListItem(
            name:
                "${res["data"][i]["items_name"]} - ${res["data"][i]["categories_name"]}"));
      }
      getData();
    } else {}

    update();
  }

  AdsData logInData = AdsData(Get.find());
  eidteCatagore() async {
    if (formstate.currentState!.validate()) {
      if (file != null) {
        statusRequest = StatusRequest.loading;
        update();
        var res = await logInData.updataImg(
            Cat["ads_id"],
            textController[0].text,
            textController[1].text,
            textController[2].text,
            textController[3].text,
            itemToId[textController[4].text.toString()],
            Cat["ads_image"],
            file!);
        statusRequest = handleData(res);
        if (statusRequest == StatusRequest.success) {
          if (res['status'] == "success") {
            catagresController.getDateInApp();
            Get.back();
          } else {}
        }

        update();
      } else {
      
        statusRequest = StatusRequest.loading;
        update();
        var res = await logInData.updata(
            Cat["ads_id"],
            textController[0].text,
            textController[1].text,
            textController[2].text,
            textController[3].text,
            itemToId[textController[4].text.toString()],
            Cat["ads_image"]);
       
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

    textController[0].text = Cat["ads_title"];
    textController[1].text = Cat["ads_title_ar"];
    textController[2].text = Cat["ads_con"];
    textController[3].text = Cat["ads_con_ar"];
    textController[4].text = idToItem[Cat["ads_item"]];
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  Future<void> onInit() async {
    getDateInApp();

    super.onInit();
  }
}
