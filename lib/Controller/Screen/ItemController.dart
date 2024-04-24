// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/item.dart';

class ItemController extends GetxController {
  List Catagres = [];

  StatusRequest statusRequest = StatusRequest.none;

  ItemData logInData = ItemData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.select();
  
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Catagres.clear();
        Catagres.addAll(res["data"]);
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
              var res = await logInData.delete(
                  Catagres[index]["items_id"], Catagres[index]["items_img"]);
              statusRequest = handleData(res);
            
              if (statusRequest == StatusRequest.success) {
              
                  Get.back();
                  Catagres.removeAt(index);
               
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
        const  Spacer(),
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
