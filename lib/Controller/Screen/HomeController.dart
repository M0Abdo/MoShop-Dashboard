// ignore_for_file: file_names

import 'package:electronic_shop_dashboard/Controller/Screen/CatagresController.dart';
import 'package:electronic_shop_dashboard/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Screen/Ads/AddAds.dart';
import '../../Screen/Catagore/AddCatagore.dart';
import '../../Screen/Ads/Ads.dart';
import '../../Screen/Catagore/Catagore.dart';
import '../../Screen/Dashboard.dart';
import '../../Screen/DeliveryCost/AddDeliveryCost.dart';
import '../../Screen/DeliveryCost/DeliveryCost.dart';
import '../../Screen/DeliveryMan/AddDeliveryMan.dart';
import '../../Screen/DeliveryMan/DeliveryMan.dart';
import '../../Screen/Items/AddItem.dart';
import '../../Screen/Items/Item.dart';
import '../../Screen/Order/Orders.dart';
import '../AppRoute.dart';
import 'AdsController.dart';
import 'DashboardControoller.dart';
import 'DeliveryManController.dart';
import 'DeliveyCostController.dart';
import 'ItemController.dart';
import 'OrderController.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  int select = 0;
  change(int v) {
    select = v;
    if (select != 0) Get.delete<DashboardController>();
    if (select != 1) Get.delete<CatagresController>();
    if (select != 2) Get.delete<ItemController>();
    if (select != 6) Get.delete<DeliveyCostController>();
    if (select != 5) Get.delete<DeliveryManController>();
    if (select != 3) Get.delete<AdsController>();
    if (select != 4) Get.delete<OrderController>();
    update();
  }

  List<Widget> add = [
    Container(),
    const AddCatagore(),
    const AddItem(),
    const AddAds(),
    Container(),
    const AddDeliveryMan(),
    const AddDeliveryCost()
  ];
  List<IconData> icons = [
    Icons.dashboard,
    Icons.category_outlined,
    Icons.data_array,
    Icons.ads_click_outlined,
    Icons.shopping_cart_outlined,
    Icons.delivery_dining_outlined,
    Icons.monetization_on_outlined,
  ];
  List<String> titles = [
    " Dashboard",
    " Categores",
    " items",
    " Ads",
    " Orders",
    " Delivery Man",
    " Delivery Cost",
  ];
  List<Widget> pages = [
    const Dashboard(),
    const Catagore(),
   const Items(),
   const Ads(),
   const Orders(),
   const DeliveryMan(),
   const DeliveryCost(),
  ];
  logout() {
    Get.defaultDialog(
        title: "Logout",
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure to logout?",
        middleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
          const Spacer(),
          GestureDetector(
            onTap: () async {
              myServices.sharedPreferences.setString("id", "");
              myServices.sharedPreferences.setString("username", "");
              myServices.sharedPreferences.setString("manger", "");

              myServices.sharedPreferences.setString("check", "");
              Get.offAllNamed(AppRoute.login);
            },
            child: const SizedBox(
                height: 20,
                width: 50,
                child: Text(
                  "Logout",
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
                  "Canel",
                )),
          ),
         const Spacer()
        ]);
  }

}
