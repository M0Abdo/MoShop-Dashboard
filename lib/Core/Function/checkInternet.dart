// ignore_for_file: file_names


import 'dart:io';

checkInternet() async {
  try {
    var res = await InternetAddress.lookup("google.com");
    if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException {
    return false;
  }
  
}
