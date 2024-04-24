import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/OrderController.dart';
import '../../Core/Class/HandelData.dart';
import '../../Screen/Order/OrderDetails.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child:(controller.history.isEmpty)?Center(child: Text("No Orders",style: TextStyle(fontWeight: FontWeight.bold),),): ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () {
                    Get.to(OrderDetails(),
                        arguments: controller.history[index]);
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
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Order Number: ${controller.history[index]["order_id"]}",
                                                    maxLines: 4,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                               
                                                  Text(
                                                    "Client: ${(controller.history[index]["address_user_name"]==null)?controller.history[index]["users_name"]:controller.history[index]["address_user_name"]}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  
                                                  Text(
                                                    "Total Price: ${controller.history[index]["order_price"]}\$",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                              if(controller.history[index]["order_address"] != null)    
                                                  Text(
                                                    "Delivery Cost: ${controller.history[index]["order_delivery"]}\$",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    "Time: ${controller.history[index]["order_time"]}",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 46, 46, 46),
                                                        fontSize: 16),
                                                  ),
                                                  
                                                ],
                                              ),
                                              Spacer(),
                                               if(controller.history[index]["order_state"] ==
                                                    '4')
                                                    Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Color.fromARGB(255, 255, 17, 0),
                              size: 50,
                            ),
                            Text(
                              "Erorr Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                            ),
                          ],
                        ),
                       
                          if (controller.history[index]["order_state"] == '2')
                        Column(
                          children: [
                            Icon(
                              Icons.task_alt_outlined,
                              color: Color.fromARGB(255, 0, 213, 7),
                              size: 50,
                            ),
                            Text(
                            (controller.history[index]["order_address"] == null)?"Order recived":   "Order delivered ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 213, 7)),
                            )
                          ],
                        ),
                      if (controller.history[index]["order_state"] == '3')
                        Column(
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              color: Color.fromARGB(255, 255, 17, 0),
                              size: 50,
                            ),
                            Text(
                              "Order Canced",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                            ),
                          ],
                        ),
                                            ],
                                          ),
                                        ),
                                      ),),
        ),
      ),itemCount: controller.history.length,),
    )),);
  }
}