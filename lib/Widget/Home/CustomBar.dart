import 'package:electronic_shop_dashboard/Controller/Screen/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/Color.dart';

class CustomBar extends StatelessWidget {
  final int se;
  final String title;
  final IconData iconData;
  const CustomBar({super.key, required this.se, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () => controller.change(se),
                child: Container(
                  width: 160.w,
                  height: 20.h,
                   decoration: BoxDecoration(
                  
                    border:(controller.select==se)? Border(
                                    bottom: BorderSide(
                                        color: Appcolor.primaryColor,
                                        width: 3.0.w)):null
                   ),
                     
                    
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconData,
                          color: (controller.select==se)?Appcolor.primaryColor:Colors.black,
                        size: 20.h,
                      ),
                      Text(
                        " ${title}",
                        
                        style: TextStyle(
                        
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                              color: (controller.select==se)?Appcolor.primaryColor:Colors.black,),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
