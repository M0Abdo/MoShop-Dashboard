import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Color.dart';
import '../../Controller/Screen/OrderController.dart';

class CustomBar extends StatelessWidget {

  final int index;
  const CustomBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GetBuilder<OrderController>(
      builder:(controller) =>  GestureDetector(
                    onTap: () => controller.change(index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                      
                        width: 105,
                        height: 30,
                         decoration: BoxDecoration(
                        
                        
                          border:(controller.select==index)? Border(
                                          bottom: BorderSide(
                                              color: Appcolor.primaryColor,
                                              width: 2.0)):null
                         ),
                           
                          
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Text(
                              " ${controller.titles[index]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                    color: (controller.select==index)?Appcolor.primaryColor:Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
    ));
  }
}