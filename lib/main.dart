import 'package:electronic_shop_dashboard/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Binding/InitialBinding.dart';
import 'Core/Services/services.dart';

Future<void> main() async {
    await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) { 
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
       // home: /*(myServices.sharedPreferences.getString('choose')=="1")? const Onboard():*/lengagePage(),
        //routes: appRoutes,
         getPages: route,
       //   home: test(),
          initialBinding: InitialBinding(),
      
      );
       },
     
    );
  }
}
