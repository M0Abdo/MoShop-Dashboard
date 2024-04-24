// ignore_for_file: file_names

import 'package:electronic_shop_dashboard/AppLink.dart';
import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../Controller/Screen/CatagresController.dart';

import 'EidteCatagore.dart';

class Catagore extends StatelessWidget {
  const Catagore({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatagresController());
    return GetBuilder<CatagresController>(
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
                              child: SvgPicture.network(
                                "${AppLink.ImgCategories}${controller.Catagres[index]["categories_image"]}",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Id: ${controller.Catagres[index]["categories_id"]}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${controller.Catagres[index]["categories_name"]}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${controller.Catagres[index]["categories_arabic"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(const EditeCatagore(),arguments: controller.Catagres[index]);
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
                    itemCount: controller.Catagres.length),
              ),
            ));
  }
}
