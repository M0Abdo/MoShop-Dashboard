import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../AppLink.dart';
import '../../Controller/Color.dart';
import '../../Controller/Screen/DetailsDeliveryController.dart';
import '../../Controller/imgAssets copy.dart';
import '../../Core/Class/HandelData.dart';
import '../../Core/Class/statusRequest.dart';

class DetailsDeliveryMan extends StatelessWidget {
  const DetailsDeliveryMan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsDeliveryController());
    return Scaffold(
        body: GetBuilder<DetailsDeliveryController>(
      builder: (controller) => HandelDataRequest(
          stateRequest: controller.statusRequest,
          widget:(controller.statusRequest==StatusRequest.loading)?Container(
       
        color: Colors.white,
        child: Center( 
          child: Lottie.asset(ImgAsset.Loading,height: 180,width: 180),
        ),
      ): Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
              child: ListView(children: [
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 18.0,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Delivery Details",
                    style: TextStyle(
                        color: Appcolor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0),
                  ),
                  const Spacer()
                ]),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Delivery Id: ${controller.details["delivery_id"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color.fromARGB(255, 55, 54, 54)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolor.primaryColor),
                          color: Color.fromARGB(93, 158, 158, 158),
                        ),
                        child: Image.network(
                            "${AppLink.ImgProfile}${controller.details["delivery_img"]}"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "${controller.details["delivery_name"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color.fromARGB(255, 55, 54, 54)),
                    textAlign: TextAlign.center,
                    maxLines: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Username: ${controller.details["delivery_email"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Password: ${controller.details["delivery_pass"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Phone: ${controller.details["delivery_phone"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    maxLines: 20,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Address: ${controller.details["delivery_address"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    textAlign: TextAlign.center,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Date of joining\n${DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.details["delivery_time"]))}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    textAlign: TextAlign.center,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  child: Text(
                    "Rating",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Text(
                  "${controller.rat.toStringAsFixed(1)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color.fromARGB(255, 31, 31, 31)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (controller.rat >= 1.0)
                          ? Icon(Icons.star,
                              size: 40, color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.rat == 0.0)
                              ? Icon(
                                  Icons.star_border,
                                  size: 40,
                                )
                              : Icon(
                                  Icons.star_half,
                                  size: 40,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                ),
                      (controller.rat >= 2.0)
                          ? Icon(Icons.star,
                              size: 40, color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.rat > 1.0 && controller.rat < 2.0)
                              ? Icon(
                                  Icons.star_half,
                                  size: 40,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: 40,
                                ),
                      (controller.rat >= 3.0)
                          ? Icon(Icons.star,
                              size: 40, color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.rat > 2.0 && controller.rat < 3.0)
                              ? Icon(Icons.star_half,
                                  size: 40,
                                  color: Color.fromARGB(255, 255, 166, 0))
                              : Icon(
                                  Icons.star_border,
                                  size: 40,
                                ),
                      (controller.rat >= 4.0)
                          ? Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0),
                              size: 40,
                            )
                          : (controller.rat > 3.0 && controller.rat < 4.0)
                              ? Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                  size: 40,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: 40,
                                ),
                      (controller.rat == 5.0)
                          ? //3.3
                          Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0),
                              size: 40,
                            )
                          : (controller.rat > 4.0 && controller.rat < 5.0)
                              ? Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                  size: 40,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: 40,
                                ),
                    ],
                  ),
                ),
                if (!controller.rating.isEmpty)
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                            ),
                            child: Text(
                              "Reviews",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 122, 122, 122),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: double.infinity),
                              child: ListView.builder(
                                  itemCount: controller.rating.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 227, 227, 227),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    minLeadingWidth: 0.0,
                                                    leading: CircleAvatar(
                                                      radius: 22.0,
                                                      backgroundColor:
                                                          Colors.blue[200],
                                                      child: Center(
                                                        child: Image.asset(
                                                            (controller.rating[
                                                                            index]
                                                                        [
                                                                        "user_gen"] ==
                                                                    '0')
                                                                ? ImgAsset
                                                                    .BoyImg
                                                                : ImgAsset
                                                                    .GirlImg,
                                                            height: 40),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      "${controller.rating[index]["users_name"]}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17),
                                                    ),
                                                    trailing: Container(
                                                      width: 95,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index1) {
                                                          print(controller
                                                                  .rating[index]
                                                              ["dRating_num"]);
                                                          return (index1+1 <=
                                                                  int.parse(controller
                                                                              .rating[
                                                                          index]
                                                                      [
                                                                      "dRating_num"]))
                                                              ? Icon(Icons.star,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          166,
                                                                          0))
                                                              : Icon(
                                                                  Icons
                                                                      .star_border,
                                                                );
                                                        },
                                                        itemCount: 5,
                                                      ),
                                                    ),
                                                    subtitle: Text(
                                                        "${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(controller.rating[index]['dRating_time']))}"),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 15,
                                                        left: 15,
                                                        bottom: 10.0),
                                                    child: Text(
                                                      "${controller.rating[index]['dRating_comment']}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      maxLines: 15,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ]),
                                          )),
                                    );
                                  }))
                        ],
                      ))
              ]))),
    ));
  }
}
