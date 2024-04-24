// ignore_for_file: file_names

import 'package:get/get.dart';

import '../Core/Class/Crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
