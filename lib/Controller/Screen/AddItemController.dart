// ignore_for_file: file_names

import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/item.dart';
import '../../Screen/Items/AddDetails.dart';
import '../uploadeImage.dart';

class AddItemController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  StatusRequest statusRequest = StatusRequest.none;
  List<File> files = [];
  Map<String, String> itemToId = {};
  File? file, fileTest;
  List<SelectedListItem> dataBox = [];
  List<String> titles = [
    "Item Name",
    "Item Name (arbic)",
    "Brand Name",
    "Brand Name (arbic)",
    "Description",
    "Description (arbic)",
    "Price",
    "discount",
    "Count"
  ];
  addImg() async {
    file = await uploadImage();
    update();
  }

  addImgs() async {
    fileTest = await uploadImage();
    if (fileTest != null) files.add(fileTest!);
    update();
  }

  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.firstadd();
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        for (var i = 0; i < res["data"].length; i++) {
          itemToId[
                  "${res["data"][i]["categories_id"]} - ${res["data"][i]["categories_name"]}"] =
              "${res["data"][i]["categories_id"]}";
          dataBox.add(SelectedListItem(
              name:
                  "${res["data"][i]["categories_id"]} - ${res["data"][i]["categories_name"]}"));
        }
      } else {}
    }

    update();
  }

  ItemData logInData = ItemData(Get.find());
  addCatagore() async {
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
          textController[6].text,
          textController[7].text,
          textController[8].text,
          itemToId[textController[9].text.toString()].toString(),
          file!);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          if (files.isEmpty) {
            addImage(res["data"]["items_id"]);
            Get.off(const AddDetails(), arguments: {"id": res["data"]["items_id"],"st":'0'});
          } else {
            Get.off(const AddDetails(), arguments: {"id": res["data"]["items_id"],"st":'0'});
          }
        }
      }

      update();
    }
  }

  longTap(int index) {
    Get.defaultDialog(
        title: "Delete",
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure to Delete?",
        middleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
          const Spacer(),
          GestureDetector(
            onTap: () async {
              files.removeAt(index);
              Get.back();
              update();
            },
            child: const SizedBox(
                height: 20,
                width: 50,
                child: Text(
                  "Yes",
                )),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  "No",
                )),
          ),
          const Spacer()
        ]);
  }

  addImage(String id) async {
    statusRequest = StatusRequest.loading;
    for (var i = 0; i < files.length; i++) {
    }
    statusRequest = StatusRequest.success;
  }

  @override
  void onInit() {
    textController[6].text = '0';
    textController[7].text = '0';
    textController[8].text = '1';
    getDateInApp();
    super.onInit();
  }

  void changeCheck() {
    update();
  }
}
