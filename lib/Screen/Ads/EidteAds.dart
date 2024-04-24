// ignore_for_file: file_names, must_be_immutable, library_private_types_in_public_api

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:electronic_shop_dashboard/AppLink.dart';
import 'package:electronic_shop_dashboard/Controller/Color.dart';
import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/EditeAdsController.dart';
import '../../Widget/CustomFormFiled.dart';

class EditeAds extends StatelessWidget {
  const EditeAds({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditeAdsController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title:const Text(
            "Edit Ads",
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
        body: GetBuilder<EditeAdsController>(
          builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget: Form(
            key: controller.formstate,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding:const EdgeInsets.all(15),
              color: Colors.white,
              child: ListView(children: [
                
SizedBox(
      height: 210,
      child:  Stack(
              children: [
                Container( height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 26, 120),
                          borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(5),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0), 
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                controller.textController[0].text,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                width: 220,
                                child: Text(
                                  controller.textController[2].text,
                                  maxLines: 4,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                           const Spacer(),
                            GestureDetector(
                              onTap: () {
                               
                            
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  height: 40,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.blue,
                                        Colors.pink,
                                        Colors.orange
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.network(
                            "${AppLink.ImgItem}${controller.Cat["ads_image"]}",
                            height: 145,
                           
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                
              ],
            )),
         
    
    const Padding(
                             padding:  EdgeInsets.symmetric(vertical: 8.0),
                             child: Text("Image must be without background and space in aspects",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                           )
,  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.addImg(),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration
                       (color:const Color.fromARGB(122, 28, 37, 132),borderRadius: BorderRadius.circular(10))
                       ,child: const Center(child: Text("Change Image",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                      ),
                    ),
                  ],
                ),
                GridView.builder(physics:const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              
                              gridDelegate:
                                 const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 3.3,
                                crossAxisSpacing: 10.0,
                              ), itemBuilder: (context, index) =>  CustomFormFiled(
                                 onChanged: (val) {
                        controller.changeCheck();
                      },
                    controller: controller.textController[index],
                    title: controller.titles[index],
                    islast:(index==controller.titles.length-1)?true: false,
                    isFile: false,
                    isNumber: false,
                    file: controller.file),itemCount: controller.titles.length,)
               
              ,
                            AppTextField(cities: controller.dataBox,hint:"Select Item",isCitySelected: true,),
                             
                       Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.eidteCatagore();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child:const Center(
                              child: Text(
                            "Edit",
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

class AppTextField extends StatefulWidget {
 

  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;
  String list = "";
  AppTextField({

    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  /// This is on text changed method which will display on city text field on changed.
 

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditeAdsController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
             validator: (value){
              if (value!.isEmpty) {
                return "Please select item";
              }
              return null; 
             },
             
            onChanged: (value) {
              controller.textController[4].text = widget.list;
            },
            controller: controller.textController[4],
            cursorColor: Colors.black,
            onTap: widget.isCitySelected
                ? () {
                    FocusScope.of(context).unfocus();
                    DropDownState(
                      DropDown(
                        isDismissible: true,
                        data: widget.cities ?? [],
                        selectedItems: (List<dynamic> selectedList) {
                          for (var item in selectedList) {
                            if (item is SelectedListItem) {
                              widget.list = (item.name);
                            }
                          }
                          controller.changeCheck();
                          controller.textController[4].text =
                              (widget.list.toString());
                        },
                        enableMultipleSelection: false,
                      ),
                    ).showModal(context);
                  }
                : null,
            decoration: InputDecoration(
              suffixIconColor: Appcolor.primaryColor,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 215, 0, 0))),
              floatingLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              hintText: widget.hint,
              contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder:  const OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                            borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                        focusedBorder: const OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                            borderSide:
                                    BorderSide(color: Colors.black)),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

