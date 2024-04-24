import 'package:electronic_shop_dashboard/AppLink.dart';
import 'package:electronic_shop_dashboard/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/Color.dart';
import '../../Controller/Screen/AddDetailsCotroller.dart';
import '../../Widget/CustomFormFiled.dart';

class AddDetails extends StatelessWidget {
  const AddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDetailsCotroller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Add Details",
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
      body: GetBuilder<AddDetailsCotroller>(
        builder: (controller) => HandelDataRequest(
            stateRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("ِAdd Image (must be svg)",
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
                                          child: SvgPicture.file(
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
                      child: Text(
                        "ِ-OR-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("ِSelect Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.ch(index);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                padding: EdgeInsets.all(8.0),
                                child: SvgPicture.network(
                                    "${AppLink.ImgItem}${controller.Img[index]["detalis_img"]}"),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(93, 158, 158, 158),
                                    border: (controller.se == index)
                                        ? Border.all(
                                            color: Appcolor.primaryColor,
                                            width: 4.0)
                                        : null,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.Img.length,
                        ),
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
                      itemBuilder: (context, index) {
                        if (index == controller.titles.length - 1) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.titles[index]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                TextFormField(
                                  controller: controller.textController[index],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter the filed data";
                                    } else {
                                      if (controller.file == null &&
                                          controller.se == -1) {
                                        return "Please select image or add image";
                                      }
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  maxLines: 1,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Enter ${controller.titles[index]}",
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Appcolor.primaryColor))),
                                ),
                              ],
                            ),
                          );
                        }
                        return CustomFormFiled(
                            controller: controller.textController[index],
                            title: controller.titles[index],
                            islast: false,
                            isFile: false,
                            isNumber: false,
                            file: controller.file);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.addV();
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.con.getDateInApp();
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 17, 0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                "Cancel",
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
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
