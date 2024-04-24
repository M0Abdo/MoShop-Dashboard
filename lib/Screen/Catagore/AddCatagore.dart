// ignore_for_file: file_names

import 'package:electronic_shop_dashboard/Controller/Color.dart';
import 'package:electronic_shop_dashboard/Controller/Screen/AddCatagoreController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Core/Class/HandelData.dart';
import '../../Widget/CustomFormFiled.dart';

class AddCatagore extends StatelessWidget {
  const AddCatagore({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCatagoreController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title:const Text(
            "Add Catagore",
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
              icon:const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<AddCatagoreController>(
          builder: (controller) =>HandelDataRequest(stateRequest: controller.statusRequest,widget:  Form(
            key: controller.formstate,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding:const EdgeInsets.all(15),
              color: Colors.white,
              child: ListView(children: [ const Padding(
                             padding: EdgeInsets.symmetric(vertical: 8.0),
                             child: Text("Image must be svg",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                           )
,  
  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.addImg(),
                      child: SizedBox(
                                          
 height: 110,
                              width: 110, 
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(93, 158, 158, 158),
                                  borderRadius: BorderRadius.circular(10)),
                              child:(controller.file!=null)?Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.file(controller.file!,),
                              ):const Icon(
                                Icons.photo_library_outlined,
                                size: 30,
                              ),
                            ),
                            if(controller.file!=null)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
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
                CustomFormFiled(
                    controller: controller.textController[0],
                    title: controller.titles[0],
                    islast: false,
                    isFile: true,
                    isNumber: false,
                    file: controller.file),
                CustomFormFiled(
                    controller: controller.textController[1],
                    title: controller.titles[1],
                    islast: true,
                    isFile: true,
                     isNumber: false,
                    file: controller.file),
                    
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addCatagore();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
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
          )),
        ));
  }
}
