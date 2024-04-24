// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/dashbors.dart';

class DashboardController extends GetxController {
  List order = [];
  String? sales ='0',
      accept ,
      acceptinshop ,
      cancel ,
      delivery ,
      active ,
      notactive ,
      addresscost='0',
      cancelinshop ;
  ScrollController scrollController = ScrollController();
  StatusRequest statusRequest = StatusRequest.none;

  DashboardData logInData = DashboardData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await logInData.select();
   
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        order.clear();
        order.addAll(res["data"]);
        if(res["sales"]["sales"]!=null)
        sales = (res["sales"]["sales"]);
        accept = (res["accept"]["accept"]);
        acceptinshop = (res["inshop"]["inshop"]);
        cancel = (res["cancel"]["cancel"]);
        delivery = (res["delivery"]["delivery"]);
        active = (res["active"]["active"]);
        notactive = (res["notactive"]["notactive"]);
        cancelinshop = (res["cancelinshop"]["cancelinshop"]);
        if(res["addresscost"]["addresscost"]!=null)
        addresscost = (res["addresscost"]["addresscost"]);
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
