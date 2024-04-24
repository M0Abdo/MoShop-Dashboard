// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:electronic_shop_dashboard/Controller/Screen/ItemController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/item.dart';
import '../uploadeImage.dart';
import 'ItemDesController.dart';

class AddDetailsCotroller extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? id, st;
  List Img = [];
  File? file;
  int se = -1;
  addImg() async {
    file = await uploadImage(true);
    if (file != null) se = -1;
    update();
  }

  ch(int index) {
    file = null;
    se = index;
    update();
  }

  List<String> titles = [
    "Title",
    "Title (arbic)",
    "Subtitle",
    "Subtitle (arbic)",
  ];
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  StatusRequest statusRequest = StatusRequest.none;

  ItemData logInData = ItemData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.firstdetails();
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Img.addAll(res["data"]);
      } else {}
    }

    update();
  }

  ItemController con = Get.find();
  addDetails() async {
    if (file == null) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.addDetails(
          textController[0].text,
          textController[1].text,
          textController[2].text,
          textController[3].text,
          id.toString(),
          Img[se]["detalis_img"]);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          textController[0].text = "";
          textController[1].text = "";
          textController[2].text = "";
          textController[3].text = "";
          se = -1;
          if (st == '1') {
            ItemDesController con = Get.find();
            con.getDateInApp();
            Get.back();
          }
        } else {}
      }

      update();
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var res = await logInData.addDetailsImg(
          textController[0].text,
          textController[1].text,
          textController[2].text,
          textController[3].text,
          id.toString(),
          '',
          file!);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          getDateInApp();
        } else {}
      }

      update();
    }
  }

  addV() {
    if (formstate.currentState!.validate()) {
      addDetails();
    }
  }

  @override
  void onInit() {
    id = Get.arguments["id"];
    st = Get.arguments["st"];
    getDateInApp();
    super.onInit();
  }
}
