import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/DeliveyCostController.dart';
import '../../Core/Class/HandelData.dart';
import 'EditeDeliveyCost.dart';

class DeliveryCost extends StatelessWidget {
  const DeliveryCost({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveyCostController());
    return GetBuilder<DeliveyCostController>(builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(98, 158, 158, 158),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(children: [
                            
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                 
                                  Text(
                                    "${controller.DeliveryCost[index]["delivery_city"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${controller.DeliveryCost[index]["delivery_city_ar"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${controller.DeliveryCost[index]["delivery_cost"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(EditeDeliveyCost(),arguments: controller.DeliveryCost[index]);
                                  },
                                  child: Icon(Icons.edit)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                  onTap: () => controller.deletCat(index),
                                  child: Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 255, 17, 0),
                                  )),
                            )
                          ]),
                        ),
                      );
                    },
                    itemCount: controller.DeliveryCost.length),
    )),);
  }
}