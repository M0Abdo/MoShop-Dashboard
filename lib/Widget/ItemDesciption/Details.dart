// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Controller/Color.dart';
import '../../AppLink.dart';
import '../../Controller/Screen/ItemDesController.dart';
import '../../Screen/Items/AddDetails.dart';

class Detalis extends StatelessWidget {
  const Detalis({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDesController>(
      builder: (controller) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(AddDetails(),
                    arguments: {"id": controller.item["items_id"], "st": '1'});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    //  margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 227, 227),
                        borderRadius: BorderRadius.circular(10)),
                    height: 70,
                    width: double.infinity,
                    child: Icon(Icons.add)),
              ),
            ),
            GridView.builder(
                itemCount: controller.detalis.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3.5,
                  crossAxisSpacing: 1.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        //  margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 227, 227, 227),
                            borderRadius: BorderRadius.circular(10)),
                        height: 20,
                        width: 160,
                        child: ListTile(
                          trailing: IconButton(
                              icon: Icon(Icons.delete,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                              onPressed: () {
                                controller.deleteDetails(index);
                              }),
                          isThreeLine: true,
                          leading: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: SvgPicture.network(
                              "${AppLink.ImgItem}/${controller.detalis[index]["detalis_img"]}",
                              color: const Color.fromARGB(255, 80, 80, 80),
                              height: 35.0,
                            ),
                          ),
                          title: Text(
                            "${controller.detalis[index]["detalis_title"]} - ${controller.detalis[index]["detalis_title_ar"]}:",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Appcolor.primaryColor),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.detalis[index]["detalis_subtitle"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              Text(
                                "${controller.detalis[index]["detalis_subtitle_ar"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          minLeadingWidth: 10.0,
                          contentPadding: const EdgeInsets.all(5.0),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
