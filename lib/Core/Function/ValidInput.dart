// ignore_for_file: file_names

import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
   
    if (type=="select") {
      return "Please select data";
    }
  
    return "Please enter the filed data";
  } else if (val.length < min&&type != "Username") {
    return "$type must be greater than $min";
  }else if(val.length>max){
    return "$type must be less than $max";
  }
  
  if (type == "Username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  } else if (type == "Email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
}
