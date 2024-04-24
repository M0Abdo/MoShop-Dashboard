// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Data/Remote/deliveryman.dart';

class DeliveryManController extends GetxController {
  List DeliveryMan = [];
  ScrollController scrollController = ScrollController();
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  DeliveryManData logInData = DeliveryManData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.select();
   
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        DeliveryMan.clear();
        DeliveryMan.addAll(res["data"]);
      } else {}
    }

    update();
  }


  deletCat(int index) async {
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
         const Spacer(),
          GestureDetector(
            onTap: () async {
              statusRequest = StatusRequest.loading;
              update();
              var res = await logInData.delete(DeliveryMan[index]["delivery_id"],
                  DeliveryMan[index]["delivery_img"]);
              
              statusRequest = handleData(res);
              if (statusRequest == StatusRequest.success) {
                if (res['status'] == "success") {
                  DeliveryMan.removeAt(index);
                  Get.back();
                } else {}
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
 

  @override
  void onInit() {
    getDateInApp();
    super.onInit();
  }
}
