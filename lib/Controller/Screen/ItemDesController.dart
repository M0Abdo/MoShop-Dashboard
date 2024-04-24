// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/item.dart';
import '../../Widget/ItemDesciption/Details.dart';
import '../../Widget/ItemDesciption/Review.dart';
import '../uploadeImage.dart';
import 'ItemController.dart';

class ItemDesController extends GetxController {
  int currentPage = 0, currentTap = 0;
  bool se = false;
  int i_need = 1;
  Map item = {};
  double allRating = 0.0;

  bool t = false, t2 = false, isRating = false;
  List detalis = [], img = [], ratings = [];
  late PageController pageController;
  late ScrollController scrollController;
  ItemData logInData = ItemData(Get.find());
  ItemController con = Get.find();
  File? file, file2;
  late StatusRequest statusRequest = StatusRequest.loading;
  addImg2() async {
    file2 = await uploadImage();
    se = true;
    update();
  }

  addImg() async {
    file = await uploadImage();
    if (file != null) {
      statusRequest = StatusRequest.loading;

      var res = await logInData.addimageItem(item["items_id"], file!);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          getDateInApp();
        }
      }
      update();
    }
  }

  deleteDetails(int index) async {
    Get.defaultDialog(
        title: "Delete",
        titleStyle:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure to Delete?",
        middleTextStyle:const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
        const  Spacer(),
          GestureDetector(
            onTap: () async {
              statusRequest = StatusRequest.loading;

              var res =
                  await logInData.deletedetails(detalis[index]["detalis_id"]);
              statusRequest = handleData(res);
             
              if (statusRequest == StatusRequest.success) {
                if (res['status'] == "success") {
                  detalis.removeAt(index);
                  Get.back();
                }
              }
              update();
            },
            child:const SizedBox(
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
            child:const SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  "No",
                )),
          ),
         const Spacer()
        ]);
  }

  longTap(int index) async {
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
        const  Spacer(),
          GestureDetector(
            onTap: () async {
              statusRequest = StatusRequest.loading;

              var res = await logInData.deleteImg(
                  img[index]["img_id"].toString(), img[index]["img_name"]);
              statusRequest = handleData(res);
             
              if (statusRequest == StatusRequest.success) {
                if (res['status'] == "success") {
                  img.removeAt(index);
                  Get.back();
                }
              }
              update();
            },
            child:const SizedBox(
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
            child:const SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  "No",
                )),
          ),
        const  Spacer()
        ]);
  }

  select() {
    se = true;
    update();
  }

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
  List<SelectedListItem> dataBox = [];
  ItemData cat = ItemData(Get.find());
  Map<String, String> itemToId = {}, idToItem = {};
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.getDateFormBack(
      item["items_id"],
    );
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        // categories.addAll(res["categories"]);
        img.clear();
        img.addAll(res["image"]);
       
        textController[0].text = item["items_name"];
        textController[1].text = item["items_name_arabic"];
        textController[2].text = item["items_brand"];
        textController[3].text = item["items_arebic_brand"];
        textController[4].text = item["items_description"];
        textController[5].text = item["items_arebic_description"];
        textController[6].text = item["items_price"];
        textController[7].text = item["items_discount"];
        textController[8].text = item["items_count"];
        textController[9].text = idToItem[item["items_cat"]]!;
        detalis = res["data"];
        if (!(res["isRating"].isEmpty)) isRating = true;
        if (res["allratingnum"]["allRating"] != null) {
          allRating = double.parse(res["allratingnum"]["allRating"]);
        }
        if (!(res["allrating"].isEmpty)) {
          ratings = res["allrating"];
          allRating /= ratings.length;
        }
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  edite() async {
    if (formstate.currentState!.validate()) {
      if (file2 == null) {
        statusRequest = StatusRequest.loading;
        update();
        var res = await logInData.edite(
            item["items_id"],
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
            item["items_img"]);
        statusRequest = handleData(res);
        
        if (statusRequest == StatusRequest.success) {
          if (res['status'] == "success") {
            se = false;
            con.getDateInApp();
          }
        }

        update();
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var res = await logInData.editeImg(
            item["items_id"],
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
            item["items_img"],
            file2!);
        statusRequest = handleData(res);
        
        if (statusRequest == StatusRequest.success) {
          if (res['status'] == "success") {
            se = false;
            con.getDateInApp();
          }
        }

        update();
      }
    }
  }

  active() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.active(
        item["items_id"], (item["items_active"] == '1') ? "0" : "1");
    statusRequest = handleData(res);
  
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        con.getDateInApp();
        Get.back();
      }
    }
  }

  first() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await cat.firstadd();

    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        for (var i = 0; i < res["data"].length; i++) {
          itemToId[
                  "${res["data"][i]["categories_id"]} - ${res["data"][i]["categories_name"]}"] =
              "${res["data"][i]["categories_id"]}";
          idToItem["${res["data"][i]["categories_id"]}"] =
              "${res["data"][i]["categories_id"]} - ${res["data"][i]["categories_name"]}";
          dataBox.add(SelectedListItem(
              name:
                  "${res["data"][i]["categories_id"]} - ${res["data"][i]["categories_name"]}"));
          getDateInApp();
        }
      } else {}
    }

    update();
  }

  void changeCheck() {
    se = true;
    update();
  }

  onTapDetailsReview(int v) {
    currentTap = v;
    update();
  }

  List<Widget> listPage = [const Detalis(), const Review()];

  @override
  onInit() {
    item = Get.arguments;
    first();

    pageController = PageController();
    scrollController = ScrollController();

    super.onInit();
  }
}
