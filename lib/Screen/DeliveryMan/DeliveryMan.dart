import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppLink.dart';
import '../../Controller/Screen/DeliveryManController.dart';
import '../../Core/Class/HandelData.dart';
import 'DetailsDeliveryMan.dart';
import 'EidteDeliveryMan.dart';

class DeliveryMan extends StatelessWidget {
  const DeliveryMan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryManController());
    return GetBuilder<DeliveryManController>(
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
                            Get.to(DetailsDeliveryMan(),arguments: controller.DeliveryMan[index]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(98, 158, 158, 158),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(children: [
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                    width: 100,
                                    child: Image.network(
                                        "${AppLink.ImgProfile}${controller.DeliveryMan[index]["delivery_img"]}")),
                              ),
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 15.0),
                                  child: SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.DeliveryMan[index]["delivery_name"]}",
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Divider(),
                                        Text(
                                          "${controller.DeliveryMan[index]["delivery_phone"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.to(EidteDeliveryMan(),
                                            arguments:
                                                controller.DeliveryMan[index]);
                                      },
                                      child: Icon(Icons.edit)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: GestureDetector(
                                      onTap: () => controller.deletCat(index),
                                      child: Icon(
                                        Icons.delete,
                                        color: Color.fromARGB(255, 255, 17, 0),
                                      )),
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.DeliveryMan.length),
              ),
            ));
  }
}
