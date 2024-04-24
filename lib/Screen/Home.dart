import 'package:electronic_shop_dashboard/Controller/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controller/Screen/HomeController.dart';
import '../Widget/Home/CustomBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
            floatingActionButton:
                (controller.select != 0 && controller.select != 4)
                    ? GestureDetector(
                        onTap: () {
                          Get.to(controller.add.elementAt(controller.select));
                        },
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Appcolor.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 35,
                          ),
                        ))
                    : null,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Appcolor.primaryColor,
                    ))
              ],
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text(
                "MoShop Dashboard",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 8, 99)),
              ),
            ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.titles.length,
                      itemBuilder: (context, index) => CustomBar(
                          se: index,
                          title: controller.titles[index],
                          iconData: controller.icons[index]),
                    ),
                  ),
                  Expanded(
                      flex: 24,
                      child: controller.pages.elementAt(controller.select))
                ]))));
  }
}
