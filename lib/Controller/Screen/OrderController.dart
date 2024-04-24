// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/order.dart';

import '../../Widget/Order/History.dart';
import '../../Widget/Order/InShop.dart';
import '../../Widget/Order/InWay.dart';
import '../../Widget/Order/Unreviewed.dart';

class OrderController extends GetxController {
  int select = 0;
  change(int v) {
    select = v;

    update();
  }

  List<String> titles = [
    " Unreviewed",
    " In Way",
    " In Shop",
    " History",
  ];
  List<Widget> pages = [const Unreviewed(),const InWay(),const InShop(),const History()];
  List unreviewed = [], inway = [], history = [], inshop = [];
  StatusRequest statusRequest = StatusRequest.none;

  OrderData logInData = OrderData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.select();
 
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        unreviewed.clear();
        inway.clear();
        history.clear();
        inshop.clear();
        if (!res["data"].isEmpty) unreviewed.addAll(res["data"]);
        if (!res["data1"].isEmpty) inway.addAll(res["data1"]);
        if (!res["data2"].isEmpty) history.addAll(res["data2"]);
        if (!res["data22"].isEmpty) history.addAll(res["data22"]);
        if (!res["data3"].isEmpty) inshop.addAll(res["data3"]);
      } else {}
    }

    update();
  }

  @override
  void onInit() {
    getDateInApp();
    super.onInit();
  }
}
