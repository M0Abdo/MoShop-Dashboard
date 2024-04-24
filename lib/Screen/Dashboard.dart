import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controller/Screen/DashboardControoller.dart';
import 'Order/OrderDetails.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
        child:  ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
               Colors.deepOrange, Color.fromARGB(153, 252, 121, 61),
                
              
              
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                        Icon( Icons.monetization_on_outlined,
                           color: Colors.white,
                           size: 20.h,
                              ),
                      Text(" Total Sales",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                    ],
                  ),
                  Text("  \$${controller.sales}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height/8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
               Color.fromARGB(255, 1, 255, 9), Color.fromARGB(155, 61, 248, 68),
                
              
              
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon( Icons.task_alt_outlined,
                           color: Colors.white,
                           size: 18.h,
                          
                              ),
                      Text(" Orders Accept",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.sp),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("In Shop",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.sp),),
                             Text("${controller.acceptinshop}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.sp),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("In App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.sp),),
                             Text("${controller.accept}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.sp),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
               Color.fromARGB(255, 255, 1, 1), Color.fromARGB(155, 248, 61, 61),
                
              
              
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Icon( Icons.cancel_outlined,
                           color: Colors.white,
                           size: 20.h,
                          
                              ),
                      Text(" Orders Cancel",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                    ],
                  ),
                 Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("In Shop",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                             Text("${controller.cancelinshop}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("In App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                             Text("${controller.cancel}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24.sp),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
               Color.fromARGB(255, 18, 1, 255), Color.fromARGB(155, 67, 61, 248),
                
              
              
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Icon( Icons.shopping_cart_outlined,
                           color: Color.fromARGB(255, 251, 251, 251),
                              ),
                      Text(" Items",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                    ],
                  ),
                 Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Active",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                             Text("${controller.active}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Not Active",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                             Text("${controller.notactive}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
               Color.fromARGB(255, 1, 158, 255), Color.fromARGB(155, 61, 145, 248),
                
              
              
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Icon( Icons.delivery_dining,
                           color: Colors.white,
                              ),
                      Text(" Delivery Mans",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                    ],
                  ),
                  Text("  ${controller.delivery}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                ],
              ),
            ),
          ), Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
               Color.fromARGB(255, 242, 1, 255), Color.fromARGB(155, 158, 61, 248),
                
              
              
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Icon( Icons.monetization_on_outlined,
                           color: Colors.white,
                              ),
                      Text(" Delivery Cost",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                    ],
                  ),
                  Text("  \$${controller.addresscost}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                ],
              ),
            ),
          ),
            Text("Under Review Orders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
           (controller.order.isEmpty)?SizedBox(height: 100, child: Center(child: Text("No Orders",style: TextStyle(fontWeight: FontWeight.bold),),)) :GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.order.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 2.0,
                                crossAxisSpacing: 10.0,
                              ),
                              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(OrderDetails(),
                        arguments: controller.order[index]);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(98, 158, 158, 158),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Number: ${controller.order[index]["order_id"]}",
                              maxLines: 4,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "Client: ${controller.order[index]["address_user_name"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "Phone: ${controller.order[index]["address_phone"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "Total Price: ${controller.order[index]["order_price"]}\$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "Delivery Cost: ${controller.order[index]["order_delivery"]}\$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "Time: ${controller.order[index]["order_time"]}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 46, 46, 46),
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                              )
        ]),
    )),);
  }
}
