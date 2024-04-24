
import 'package:get/get.dart';

import 'Controller/AppRoute.dart';
import 'Core/MiddelWare/MyMiddelWare.dart';
import 'Screen/Home.dart';
import 'Screen/Login.dart';


List<GetPage<dynamic>>? route = [
  
  GetPage(name: "/", page: ()=> const Login(),middlewares: [
    MyMiddelWare()
  ]),
   GetPage(name: AppRoute.home, page:()=> const Home()),
];

