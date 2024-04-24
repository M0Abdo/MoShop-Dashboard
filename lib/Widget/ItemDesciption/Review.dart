// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Controller/Color.dart';
import '../../../Controller/imgAssets.dart';
import '../../Controller/Screen/ItemDesController.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDesController>(
      builder: (controller) =>
       Container(
               padding: const EdgeInsets.all(8.0),
               decoration: BoxDecoration(
                   color: Colors.grey.shade200,
                   borderRadius: BorderRadius.circular(15.0)),
                   child:  Column(
                     children: [
                       Text(
               "${controller.allRating.toStringAsFixed(1)}",
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 35,
                   color: Color.fromARGB(255, 31, 31, 31)),
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 (controller.allRating >= 1.0)
                     ? Icon(Icons.star,
                         color: Color.fromARGB(255, 255, 166, 0))
                     : (controller.allRating == 0.0)
                         ? Icon(Icons.star_border)
                         : Icon(
                             Icons.star_half,
                             color: Color.fromARGB(255, 255, 166, 0),
                           ),
                 (controller.allRating >= 2.0)
                     ? Icon(Icons.star,
                         color: Color.fromARGB(255, 255, 166, 0))
                     : (controller.allRating > 1.0 &&
                             controller.allRating < 2.0)
                         ? Icon(
                             Icons.star_half,
                             color: Color.fromARGB(255, 255, 166, 0),
                           )
                         : Icon(Icons.star_border),
                 (controller.allRating >= 3.0)
                     ? Icon(Icons.star,
                         color: Color.fromARGB(255, 255, 166, 0))
                     : (controller.allRating > 2.0 &&
                             controller.allRating < 3.0)
                         ? Icon(
                             Icons.star_half,
                             color: Color.fromARGB(255, 255, 166, 0),
                           )
                         : Icon(Icons.star_border),
                 (controller.allRating >= 4.0)
                     ? Icon(Icons.star,
                         color: Color.fromARGB(255, 255, 166, 0))
                     : (controller.allRating > 3.0 &&
                             controller.allRating < 4.0)
                         ? Icon(
                             Icons.star_half,
                             color: Color.fromARGB(255, 255, 166, 0),
                           )
                         : Icon(Icons.star_border),
                 (controller.allRating == 5.0)
                     ? //3.3
                     Icon(Icons.star,
                         color: Color.fromARGB(255, 255, 166, 0))
                     : (controller.allRating > 4.0 &&
                             controller.allRating < 5.0)
                         ? Icon(
                             Icons.star_half,
                             color: Color.fromARGB(255, 255, 166, 0),
                           )
                         : Icon(Icons.star_border),
               ],
             ),
             Text(
               "${controller.ratings.length} Reviews",
               style: TextStyle(
                 fontWeight: FontWeight.w600,
               ),
             ),
                       ConstrainedBox(
                           constraints:
                               BoxConstraints(maxHeight: double.infinity),
                           child: ListView.builder(
                               itemCount: controller.ratings.length,
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
                                                         (controller.ratings[
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
                                                   "${controller.ratings[index]["users_name"]}",
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
                                                               .ratings[index]
                                                           ["rating_num"]);
                                                       return (index1+1 <=
                                                               int.parse(controller
                                                                           .ratings[
                                                                       index]
                                                                   [
                                                                   "rating_num"]))
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
                                                     "${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(controller.ratings[index]['rating_time']))}"),
                                               ),
                                               Padding(
                                                 padding: EdgeInsets.only(
                                                     right: 15,
                                                     left: 15,
                                                     bottom: 10.0),
                                                 child: Text(
                                                   "${controller.ratings[index]['rating_text']}",
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
                               })),
                     ],
                   ),
                   )
        
  );
  }
}
