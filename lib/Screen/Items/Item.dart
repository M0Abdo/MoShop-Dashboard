// ignore_for_file: file_names

import 'package:electronic_shop_dashboard/AppLink.dart';
import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Color.dart';

import '../../Controller/Screen/ItemController.dart';
import '../../Controller/ValidInput.dart';
import '../../Controller/imgAssets.dart';
import 'itemDescription.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemController());
    return GetBuilder<ItemController>(
        builder: (controller) => HandelDataRequest(
              stateRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ItemDescription(),
                                arguments: controller.Catagres[index]);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(98, 158, 158, 158),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: double.infinity),
                              child: Row(children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.all(2.0),
                                    child: Image.network(
                                      "${AppLink.ImgItem}${controller.Catagres[index]["items_img"]}",
                                    ),
                                  ),
                                ),
                              
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${controller.Catagres[index]["items_name"]}",
                                          maxLines: 20,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${controller.Catagres[index]["items_brand"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${controller.Catagres[index]["categories_name"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${controller.Catagres[index]["items_name_arabic"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${controller.Catagres[index]["items_arebic_brand"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${controller.Catagres[index]["categories_arabic"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              
                                Expanded(
                                  
                                  child: Row(
                                    children: [
                                      
                                       GestureDetector(
                                           onTap: () {
                                           
                                           },
                                           child:(controller.Catagres[index]["items_active"]=='1')?Icon(
                                                             Icons.task_alt_outlined,
                                                             color: Color.fromARGB(255, 0, 213, 7),
                                                            
                                                           ): Icon(Icons.cancel_outlined,  color:
                                                 Color.fromARGB(255, 255, 17, 0),)),
                                      GestureDetector(
                                          onTap: () => controller.deletCat(index),
                                          child: Icon(
                                            Icons.delete,
                                            color:
                                                Color.fromARGB(255, 255, 17, 0),
                                          )),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.Catagres.length),
              ),
            ));
  }
}
