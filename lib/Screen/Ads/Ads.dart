// ignore_for_file: file_names

import 'package:electronic_shop_dashboard/AppLink.dart';
import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:electronic_shop_dashboard/Screen/Ads/EidteAds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/AdsController.dart';
class Ads extends StatelessWidget {
  const Ads({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdsController());
    return GetBuilder<AdsController>(
        builder: (controller) => HandelDataRequest(
              stateRequest: controller.statusRequest,
              widget: Container(
                padding:const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          padding:const EdgeInsets.all(8.0),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color:const Color.fromARGB(98, 158, 158, 158),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding:const EdgeInsets.all(10.0),
                              child: Image.network(
                                "${AppLink.ImgItem}${controller.ads[index]["ads_image"]}",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Id: ${controller.ads[index]["ads_id"]}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${controller.ads[index]["ads_title"]}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${controller.ads[index]["ads_title_ar"]}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          const  Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                  onTap: () {
                                     Get.to(const EditeAds(),arguments: controller.ads[index]);
                                  },
                                  child:const Icon(Icons.edit)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                  onTap: () => controller.deletCat(index),
                                  child:const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 255, 17, 0),
                                  )),
                            )
                          ]),
                        ),
                      );
                    },
                    itemCount: controller.ads.length),
              ),
            ));
  }
}
