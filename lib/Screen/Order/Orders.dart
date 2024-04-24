import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Color.dart';
import '../../Controller/Screen/OrderController.dart';
import '../../Widget/Order/CustomBar.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return GetBuilder<OrderController>(
    builder:(controller) =>  Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
          children: [
            Expanded(flex: 1, child:
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
             CustomBar(index: 0),
             CustomBar(index: 1),
             CustomBar(index: 2),
              CustomBar(index: 3),
                        ],
                      ),
                    ),
                
            Expanded(flex: 18, child: controller.pages.elementAt(controller.select)),
          ],
        ),
    ),
    );
  }
}