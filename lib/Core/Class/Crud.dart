// ignore_for_file: file_names, empty_catches

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:electronic_shop_dashboard/Core/Class/statusRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

import '../Function/checkInternet.dart';

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('MoAbdo:mohamed_243045'))}';

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(
        Uri.parse(url), /*headers: myheaders*/
      );
      if (response.statusCode == 200) {
        var con = jsonDecode(response.body);
        return con;
      } else {}
    } catch (e) {}
  }

  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>?> postRequest(
    String url,
    Map data,
  ) async {
    if (await checkInternet()) {
      try {
        var response = await http.post(
          Uri.parse(url),
          body: data, /*headers: myheaders*/
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map con = jsonDecode(response.body);
          return Right(con);
        } else {
          return const Left(StatusRequest.serverException);
        }
      } catch (e) {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offline);
    }
  }

  postfileRequest(String url, Map data, File file) async {
    if (await checkInternet()) {
      try {
        var req = http.MultipartRequest("POST", Uri.parse(url));

        var len = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile("file", stream, len,
            filename: basename(file.path));

        req.headers.addAll(myheaders);
        req.files.add(multipartFile);
        data.forEach((key, value) {
          req.fields[key] = value;
        });

        var myReq = await req.send();

        var res = await http.Response.fromStream(myReq);

        if (res.statusCode == 200 || res.statusCode == 201) {
          Map con = jsonDecode(res.body);
          return Right(con);
        } else {
          return const Left(StatusRequest.serverException);
        }
      } catch (e) {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offline);
    }
  }
}
