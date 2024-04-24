import 'package:electronic_shop_dashboard/Controller/Color.dart';
import 'package:electronic_shop_dashboard/Controller/Screen/AddCatagoreController.dart';
import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/AddDeliveryManController.dart';
import '../../Widget/CustomFormFiled.dart';

class AddDeliveryMan extends StatelessWidget {
  const AddDeliveryMan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDeliveryManController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Add Deliery Man",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 8, 99)),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<AddDeliveryManController>(
          builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget: Form(
            key: controller.formstate,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: ListView(children: [ Padding(
                             padding: const EdgeInsets.symmetric(vertical: 8.0),
                             child: Text("Photo of Delivery Man",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                           )
,  
  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.addImg(),
                      child: SizedBox(
                         height: 210,
                                width: 160,
                        child: Stack(
                          children: [
                            Container(
                             height: 200,
                                width: 150,
                              
                              decoration: BoxDecoration(
                                image:(controller.file!=null)? DecorationImage(image: FileImage(controller.file!,),):null,
                          
                           
                                  color: Color.fromARGB(93, 158, 158, 158),
                                 ),
                              child:(controller.file!=null)?null: Icon(
                                Icons.photo_library_outlined,
                                size: 30,
                              ),
                            ),
                             if (controller.file!=null) Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Appcolor.primaryColor,
                                      child: Icon(
                          Icons.photo_library_outlined,color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                  GridView.builder(physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 3.3,
                                crossAxisSpacing: 10.0,
                              ), itemCount: controller.titles.length,itemBuilder: (context, index) => CustomFormFiled(
                    controller: controller.textController[index],
                    title: controller.titles[index],
                    islast:(index==controller.titles.length-1)?true: false,
                    isFile: true,
                    isNumber:(index==3||index==5)?true: false,
                    file: controller.file),),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addDeliveryMan();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Add",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),)
        ));
  }
}
