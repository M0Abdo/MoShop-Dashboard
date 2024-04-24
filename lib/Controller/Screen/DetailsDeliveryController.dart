
// ignore_for_file: file_names

import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Data/Remote/deliveryman.dart';

class DetailsDeliveryController extends GetxController {
  Map details = {};
  List rating = [];
  double rat = 0;
  StatusRequest statusRequest = StatusRequest.none;
  getData() async {
    statusRequest = StatusRequest.loading;

    details = await Get.arguments;
    update();
     statusRequest = StatusRequest.loading;
    var res = await logInData.deteils(details["delivery_id"]);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        rating.addAll(res["raiting"]);
        rat = double.parse(res["allrating"]["allrating"]) / rating.length;
      } else {}
    }
    update();
  }

  DeliveryManData logInData = DeliveryManData(Get.find());

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
