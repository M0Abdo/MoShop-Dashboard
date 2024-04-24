// ignore_for_file: file_names


import '../Class/statusRequest.dart';

handleData(res) {
  if (res is StatusRequest) {
    return res;
  } else {
    return StatusRequest.success;
  }
}
