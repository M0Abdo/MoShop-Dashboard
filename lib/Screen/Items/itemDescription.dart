// ignore_for_file: file_names

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../AppLink.dart';
import '../../Controller/Color.dart';
import '../../Controller/Screen/ItemDesController.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Core/Class/statusRequest.dart';
import '../../Widget/CustomFormFiled.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDesController());

    return GetBuilder<ItemDesController>(
      builder: (controller) {
        return HandelDataRequest(
          widget: (controller.statusRequest == StatusRequest.loading)
              ? Center(
                  child:
                      Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
                )
              : Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      "Item Description",
                      style: TextStyle(
                          color: Appcolor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 18.0,
                      ),
                    ),
                  ),
                  body: Form(
                    key: controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      color: Colors.white,
                      child: ListView(children: [
                        GestureDetector(
                                onTap: () {
                                  controller.active();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                        child: Text(
                                      (controller.item["items_active"] != '1')
                                          ? "Active Item"
                                          : "Disactive Item",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    )),
                                    decoration: BoxDecoration(
                                        color: (controller.item["items_active"] !=
                                                '1')
                                            ? Color.fromARGB(255, 0, 255, 8)
                                            : Color.fromARGB(255, 255, 17, 0),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => controller.addImg2(),
                              child: SizedBox(
                                height: 110,
                                width: 110,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(93, 158, 158, 158),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: (controller.file2 != null)
                                          ? Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.file(
                                                controller.file2!,
                                              ),
                                            )
                                          : Image.network(
                                              "${AppLink.ImgItem}${controller.item["items_img"]}"),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Appcolor.primaryColor,
                                              child: Icon(
                                                  Icons.photo_library_outlined,
                                                  color: Colors.white),
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
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 3.3,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: controller.titles.length,
                          itemBuilder: (context, index) => CustomFormFiled(
                              controller: controller.textController[index],
                              title: controller.titles[index],
                              islast: (index == controller.titles.length - 1)
                                  ? true
                                  : false,
                              isFile: false,
                              onChanged: (val) {
                                controller.select();
                              },
                              isNumber: (index >= 6 && index <= 9) ? true : false,
                              file: controller.file),
                        ),
                        AppTextField(
                          cities: controller.dataBox,
                          hint: "Select Category",
                          isCitySelected: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              if (controller.se)
                                GestureDetector(
                                  onTap: () {
                                    controller.edite();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                        child: Text(
                                      "Make Changes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    )),
                                    decoration: BoxDecoration(
                                        color: Appcolor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                              
                            ],
                          ),
                        ),
                         Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Note: to delete image make long check",
                            style: TextStyle(
                              color: Colors.grey,
                                fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                        Container(
                          alignment: Alignment.center,
                          
                          height: 100,
                        
                          child:(controller.img.isEmpty)? GestureDetector(
                                      onTap: () => controller.addImg(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  93, 158, 158, 158),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ): ListView.builder(
                            controller: controller.scrollController,
                            
                          
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                               if (index == 0) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => controller.addImg(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  93, 158, 158, 158),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onLongPress: () {
                                       controller.longTap(index);
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                93, 158, 158, 158),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Image.network(
                                                                            "${AppLink.ImgItem}${controller.img[index]["img_name"]}"),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                   onLongPress: () {
                                       controller.longTap(index);
                                      },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(93, 158, 158, 158),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Image.network(
                                        "${AppLink.ImgItem}${controller.img[index]["img_name"]}"),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.img.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.onTapDetailsReview(0);
                                  },
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      if (controller.currentTap == 0)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 2.0),
                                          child: CircleAvatar(
                                            radius: 4.0,
                                            backgroundColor:
                                                Color.fromARGB(255, 0, 8, 99),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.onTapDetailsReview(1);
                                  },
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Review",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      if (controller.currentTap == 1)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 2.0),
                                          child: CircleAvatar(
                                            radius: 4.0,
                                            backgroundColor:
                                                Color.fromARGB(255, 0, 8, 99),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        controller.listPage.elementAt(controller.currentTap)
                      ]),
                    ),
                  ),
                ),
          stateRequest: controller.statusRequest,
        );
      },
    );
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
    return GetBuilder<ItemDesController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
              
            validator: (value) {
              if (value!.isEmpty) {
                return "Please select item";
              } else {
               
              }
            },
            onChanged: (value) {
              controller.textController[9].text = widget.list; controller.select();
            },
            controller: controller.textController[9],
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
                          controller.textController[9].text =
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
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Appcolor.primaryColor)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.black)),
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
