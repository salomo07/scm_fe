import 'dart:convert';

import '../models/common_response.dart';
import 'package:get/get_connect/connect.dart';

class ServiceHandler extends GetConnect{
  var isTokenExpired = false;
  CommonResponse commonResponse = CommonResponse();
  int timeoutDuration = 20;

  bool checkTokenExpired(String dateString) {
    DateTime expirationDate = DateTime.parse(dateString);
    DateTime now = DateTime.now();
    if (now.isAfter(expirationDate)) {
      return true;
    } else {
      return false;
    }
  }

  Future<CommonResponse> requestPost(String url, dynamic body) async {
    try {
      Response response = const Response();
      response = await post(url, json.encode(body)).timeout(
          Duration(seconds: timeoutDuration),
          onTimeout: () => response);
      if (response.statusCode == 200) {
        commonResponse = commonResponseFromJson(response.bodyString!);
        return commonResponse;
      } 
      return commonResponse;
    } catch (e) {
      return CommonResponse(code: 500,title: "Internet Server Error",messege: e.toString(),data: []);
    }
  }
}