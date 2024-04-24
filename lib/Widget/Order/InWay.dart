import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/OrderController.dart';
import '../../Core/Class/HandelData.dart';
import '../../Screen/Order/OrderDetails.dart';

class InWay extends StatelessWidget {
  const InWay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child:(controller.inway.isEmpty)?Center(child: Text("No Orders",style: TextStyle(fontWeight: FontWeight.bold),),):  ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: (){
              Get.to(OrderDetails(),
                        arguments: controller.inway[index]);
          },
          child: Container(
                                
                                  
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(98, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child:Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 15.0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(maxHeight: double.infinity),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order Number: ${controller.inway[index]["order_id"]}",
                                                maxLines: 4,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                           
                                              Text(
                                                "Client: ${controller.inway[index]["address_user_name"]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              
                                              Text(
                                                "Total Price: ${controller.inway[index]["order_price"]}\$",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              
                                              Text(
                                                "Delivery Cost: ${controller.inway[index]["order_delivery"]}\$",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "Time: ${controller.inway[index]["order_time"]}",
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 46, 46, 46),
                                                    fontSize: 16),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                      ),),
        ),
      ),itemCount: controller.inway.length,),
    )),);
  }
}