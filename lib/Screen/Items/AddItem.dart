import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:electronic_shop_dashboard/Controller/Color.dart';
import 'package:electronic_shop_dashboard/Controller/Screen/AddCatagoreController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/Screen/AddItemController.dart';
import '../../Core/Class/HandelData.dart';
import '../../Widget/CustomFormFiled.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Add Item",
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
        body: GetBuilder<AddItemController>(
          builder: (controller) => HandelDataRequest(
              stateRequest: controller.statusRequest,
              widget: Form(
                key: controller.formstate,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Main Image (must be without background)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
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
                                      color: Color.fromARGB(93, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: (controller.file != null)
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.file(
                                            controller.file!,
                                          ),
                                        )
                                      : Icon(
                                          Icons.photo_library_outlined,
                                          size: 30,
                                        ),
                                ),
                                if (controller.file != null)
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Extra Image (must be without background)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Text("Note: to delete image make long check",
                          style: TextStyle(
                            color: Colors.grey,
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    SizedBox(
                      height: 110,
                      child: (controller.files.isEmpty)
                          ? Row(
                              children: [
                                GestureDetector(
                                  onTap: () => controller.addImgs(),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(93, 158, 158, 158),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.addImgs(),
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
                                            child: Image.file(
                                              controller.files[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                      child: Image.file(
                                        controller.files[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.files.length,
                            ),
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
                          isNumber: (index >= 6 && index <= 9) ? true : false,
                          file: controller.file),
                    ),
                    AppTextField(
                      cities: controller.dataBox,
                      hint: "Select Category",
                      isCitySelected: true,
                    ),
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
              )),
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
    return GetBuilder<AddItemController>(
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
                if (controller.file == null) {
                  return "Please select main image";
                }
              }
            },
            onChanged: (value) {
              controller.textController[9].text = widget.list;
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
