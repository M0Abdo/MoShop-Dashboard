// ignore_for_file: file_names

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';

import '../../Data/Remote/order.dart';
import 'DashboardControoller.dart';
import 'OrderController.dart';

class OrderDetailsController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  Map order1 = {};
  List order2 = [];
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderDetailsData = OrderData(Get.find());
  OrderController con = Get.put(OrderController());
  DashboardController con2 = Get.put(DashboardController());
  changeCheck() {
    update();
  }

  Map deliveryToId = {};
  List<SelectedListItem> dataBox = [];
  getData() async {
    statusRequest = StatusRequest.loading;
    order1 = await Get.arguments;

    update();
    var res = await orderDetailsData.postdata(order1["order_id"]!);

    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        order2.addAll(res["data"]);
        for (var i = 0; i < res["delivery"].length; i++) {
          deliveryToId[
                  "${res["delivery"][i]["delivery_id"]} - ${res["delivery"][i]["delivery_name"]}"] =
              "${res["delivery"][i]["delivery_id"]}";
          dataBox.add(SelectedListItem(
              name:
                  "${res["delivery"][i]["delivery_id"]} - ${res["delivery"][i]["delivery_name"]}"));
        }
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  accept([check = true]) async {
    if (formstate.currentState!.validate()) {
      Get.defaultDialog(
          title: "Load",
          titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 0, 8, 99)),
          middleText: "Are you sure to Load?",
          middleTextStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          actions: [
            const Spacer(),
            GestureDetector(
              onTap: () async {
                if (check) {
                  statusRequest = StatusRequest.loading;
                  update();
                  var res = await orderDetailsData.adddelivery(
                      order1["order_id"]!, "1",
                      deliveryToId[textController.text.toString()].toString(),
                     );
                  print(order1["order_id"]!);
                  statusRequest = handleData(res);
                  if (statusRequest == StatusRequest.success) {
                    if (res['status'] == "success") {
                      con.getDateInApp();
                      Get.back();
                      Get.back();
                    } else {
                      statusRequest = StatusRequest.fallure;
                    }
                  }
                  update();
                } else {
                  statusRequest = StatusRequest.loading;
                  update();
                  var res = await orderDetailsData.accept_delete(
                      order1["order_id"]!, "2");

                  statusRequest = handleData(res);
                  if (statusRequest == StatusRequest.success) {
                    if (res['status'] == "success") {
                      con.getDateInApp();
                      con2.getDateInApp();
                      Get.back();
                      Get.back();
                    } else {
                      statusRequest = StatusRequest.fallure;
                    }
                  }
                  update();
                }
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
              onTap: () async {
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
  }

  cancel() async {
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
              statusRequest = StatusRequest.loading;
              update();
              var res = await orderDetailsData.accept_delete(
                  order1["order_id"]!, "3");

              statusRequest = handleData(res);
              if (statusRequest == StatusRequest.success) {
                if (res['status'] == "success") {
                  con.getDateInApp();
                  Get.back();
                  Get.back();
                } else {
                  statusRequest = StatusRequest.fallure;
                }
              }
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
            onTap: () async {
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

  errorData() async {
    Get.defaultDialog(
        title: "Error Data",
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure?",
        middleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
          const Spacer(),
          GestureDetector(
            onTap: () async {
              statusRequest = StatusRequest.loading;
              update();
              var res = await orderDetailsData.accept_delete(
                  order1["order_id"]!, "4");

              statusRequest = handleData(res);
              if (statusRequest == StatusRequest.success) {
                if (res['status'] == "success") {
                  con.getDateInApp();
                  Get.back();
                  Get.back();
                } else {
                  statusRequest = StatusRequest.fallure;
                }
              }
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

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
