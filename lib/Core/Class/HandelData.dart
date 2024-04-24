// ignore_for_file: file_names, duplicate_ignore

// ignore_for_file: file_names

import 'package:electronic_shop_dashboard/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/imgAssets.dart';


class HandelData extends StatelessWidget {
  final StatusRequest stateRequest;
  final Widget widget;
  const HandelData({super.key, required this.stateRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (stateRequest == StatusRequest.loading) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Lottie.asset(ImgAsset.Loading,height: 180,width: 180),
        ),
      );
    } else if (stateRequest == StatusRequest.offline) {
      return Container(
        color: Colors.white,
        child:Center(
        child: Lottie.asset(ImgAsset.OffLine,repeat: false),)
      );
    } else if (stateRequest == StatusRequest.serverFailure) {
      return Container(
        color: Colors.white,
        child:Center(
        child: Lottie.asset(ImgAsset.Server,repeat: false),)
      );
    } else if (stateRequest == StatusRequest.serverFailure) {
      return Container(
        color: Colors.white,
        child:Center(
        
        child: Lottie.asset(ImgAsset.NoData),)
      );
    } else {
      return widget;
    }
  }
}



class HandelDataRequest extends StatelessWidget {
  final StatusRequest stateRequest;
  final Widget widget;
  const HandelDataRequest({super.key, required this.stateRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (stateRequest == StatusRequest.loading) {
      return Container(
       
        color: Colors.white,
        child: Center( 
          child: Lottie.asset(ImgAsset.Loading,height: 180,width: 180),
        ),
      );
    } else if (stateRequest == StatusRequest.offline) {
      return Center(
        child: Lottie.asset(ImgAsset.OffLine,repeat: false),
      );
    } else if (stateRequest == StatusRequest.serverFailure) {
      return Center(
        child: Lottie.asset(ImgAsset.Server,repeat: false),
      );
    }
    else {
      return widget;
    }
  }
}
