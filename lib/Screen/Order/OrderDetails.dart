import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../AppLink.dart';
import '../../Controller/Color.dart';
import '../../Controller/Screen/OrderDetailsController.dart';
import '../../Controller/imgAssets copy.dart';
import '../../Core/Class/HandelData.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
        body: GetBuilder<OrderDetailsController>(
      builder: (controller) => HandelDataRequest(
          stateRequest: controller.statusRequest,
          widget: (controller.order1.isEmpty)
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child:
                        Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
                  ),
                )
              : Form(
                  key: controller.formstate,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10.0),
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
                          "Order Details",
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
                          "Order Number: ${controller.order1["order_id"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Color.fromARGB(255, 55, 54, 54)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (
                          controller.order1["order_address"] == null)
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Client: ${controller.order1["users_name"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 55, 54, 54)),
                                textAlign: TextAlign.center,
                                maxLines: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Email: ${controller.order1["users_email"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 55, 54, 54)),
                                textAlign: TextAlign.center,
                                maxLines: 20,
                              ),
                            ),
                          ],
                        ),
                      if ((
                          controller.order1["order_address"] != null))
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Reciver: ${controller.order1["address_user_name"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 55, 54, 54)),
                                textAlign: TextAlign.center,
                                maxLines: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Phone: ${controller.order1["address_phone"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Cite: ${controller.order1["address_cite"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Rigon: ${controller.order1["address_rigon"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                                maxLines: 20,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "Details: ${controller.order1["address_details"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                                textAlign: TextAlign.center,
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Time: ${controller.order1["order_time"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                          textAlign: TextAlign.center,
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: Text(
                                "Order",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                            ),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.order2.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 4.0,
                                crossAxisSpacing: 10.0,
                              ),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              Appcolor.primaryColor,
                                          child: Text(
                                            "${controller.order2[index]["count"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.order2[index]["items_name"]}",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 122, 122, 122),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            "${controller.order2[index]["items_brand"]}",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 122, 122, 122),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        "${(int.parse(controller.order2[index]["items_price"]) - (int.parse(controller.order2[index]["items_discount"]) / 100) * int.parse(controller.order2[index]["items_price"])).toInt()}\$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 122, 122, 122)),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: Color.fromARGB(255, 142, 147, 202),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  "${controller.order1["order_price"]}\$",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Delivery Cost",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  "${controller.order1["order_delivery"]}\$",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            if (controller.order1["order_coupon"] != '0')
                              Row(
                                children: [
                                  Text(
                                    "Discount",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Spacer(),
                                  Text(
                                    "-${((int.parse(controller.order1["order_coupon"]) / 100) * int.parse(controller.order1["order_price"])).toInt()}\$",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            const Divider(
                              thickness: 2,
                              color: Color.fromARGB(255, 142, 147, 202),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Total Price",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 57, 57, 57),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Spacer(),
                                Text(
                                  "${int.parse(controller.order1["order_price"]) + int.parse(controller.order1["order_delivery"]) - ((int.parse(controller.order1["order_coupon"]) / 100) * int.parse(controller.order1["order_price"])).toInt()}\$",
                                  style: TextStyle(
                                      color: Appcolor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ])),
                      if (controller.order1["order_state"] == '2')
                        Column(
                          children: [
                            Icon(
                              Icons.task_alt_outlined,
                              color: Color.fromARGB(255, 0, 213, 7),
                              size: 150,
                            ),
                            Text(
                           (controller.order1["order_address"] == null)?"Order recived":   "Order delivered ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 0, 213, 7)),
                            )
                          ],
                        ),
                      if (controller.order1["order_state"] == '3')
                        Column(
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              color: Color.fromARGB(255, 255, 17, 0),
                              size: 150,
                            ),
                            Text(
                              "Order Canced",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                            ),
                          ],
                        ),
                      if ((controller.order1["order_state"] == '0'))
                        Column(
                          
                          children: [
                            if (!(
                                controller.order1["order_address"] == null))
                              AppTextField(
                                cities: controller.dataBox,
                                hint: "Select Delivery Man",
                                isCitySelected: true,
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => controller.accept((!(
                                            controller
                                                    .order1["order_address"] ==
                                                null)
                                        ? true
                                        : false)),
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 19, 236, 26),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                          child: Text(
                                        (!(
                                                controller.order1[
                                                        "order_address"] ==
                                                    null))
                                            ? "Load"
                                            : "Recived",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => controller.cancel(),
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 252, 18, 2),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                          child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            if (!(
                                controller.order1["order_address"] == null))
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => controller.errorData(),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 252, 18, 2),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Center(
                                        child: Text(
                                      "Error Data",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    )),
                                  ),
                                ),
                              )
                          ],
                        ),
                          if(controller.order1["order_state"] ==
                                                    '4')
                                                    Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Color.fromARGB(255, 255, 17, 0),
                              size: 150,
                            ),
                            Text(
                              "Erorr Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                            ),
                          ],
                        ),
                    if(controller.order1["order_state"] ==
                                                    '1')  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Text(
                                  "Delivery Man",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
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
                                        border: Border.all(
                                            color: Appcolor.primaryColor),
                                        color:
                                            Color.fromARGB(93, 158, 158, 158),
                                      ),
                                      child: Image.network(
                                          "${AppLink.ImgProfile}${controller.order1["delivery_img"]}"),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "${controller.order1["delivery_name"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Color.fromARGB(255, 55, 54, 54)),
                                  textAlign: TextAlign.center,
                                  maxLines: 20,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Phone: ${controller.order1["delivery_phone"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  maxLines: 20,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Address: ${controller.order1["delivery_address"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  textAlign: TextAlign.center,
                                  maxLines: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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
    return GetBuilder<OrderDetailsController>(
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
              }
            },
            onChanged: (value) {
              controller.textController.text = widget.list;
            },
            controller: controller.textController,
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
                          controller.textController.text =
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
