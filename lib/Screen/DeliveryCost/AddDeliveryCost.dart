import 'package:electronic_shop_dashboard/Controller/Color.dart';
import 'package:electronic_shop_dashboard/Controller/Screen/AddCatagoreController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/AddDeliveryCostController.dart';
import '../../Widget/CustomFormFiled.dart';

class AddDeliveryCost extends StatelessWidget {
  const AddDeliveryCost({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDeliveryCostController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Add Delivery Cost",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 8, 99)),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<AddDeliveryCostController>(
          builder: (controller) => Form(
            key: controller.formstate,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: ListView(children: [
                CustomFormFiled(
                    controller: controller.textController[0],
                    title: controller.titles[0],
                    islast: false,
                    isFile: false,
                    isNumber: false,
                    file: null),
                CustomFormFiled(
                    controller: controller.textController[1],
                    title: controller.titles[1],
                    islast: false,
                     isNumber: false,isFile: false,
                    file: null),
                     CustomFormFiled(
                    controller: controller.textController[2],
                    title: controller.titles[2],
                    islast: true,isFile: false,
                     isNumber:true,
                    file: null),
                    

               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addCatagore();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Add",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
