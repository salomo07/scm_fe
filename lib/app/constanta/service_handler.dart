import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:scm_fe/app/middleware/cache_manager.dart';
import '../models/auth/cred_m.dart';
import '../models/common_response.dart';

class ServiceHandler extends GetConnect with CacheManager {
  dynamic header;
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
  Future<CommonResponse> fetchPostWithToken(String url, dynamic body) async {
    try {
      String jsonCredToken = getToken()!;
      CredToken credToken = credTokenFromJson(jsonCredToken);
      if (!checkTokenExpired(credToken.exp.toString())) {
        Response response = const Response();
        response = await post(url, json.encode(body)).timeout(Duration(seconds: timeoutDuration),onTimeout: () => response);
        if (response.statusCode == 200) {
          commonResponse = commonResponseFromJson(response.bodyString!);
          return commonResponse;
        } else if (response.hasError) {
          return customResponse(500, response.statusText!, response.statusText!);
        } else {
          return customResponse(response.statusCode!, response.statusText!, response.bodyString!);
        }
      }else{
          return customResponse(400, "Token is expired", "Token is expired, please re-login");
      }
    } catch (e) {
      log(e.toString());
      return customResponse(500, "Failed to send Post", e.toString());
    }
  }
  
  Future<CommonResponse> fetchPost(String url, dynamic body) async {
    try {      
      Response response = const Response();
      response = await post(url, json.encode(body)).timeout(Duration(seconds: timeoutDuration),onTimeout: () => response);
      if (response.statusCode == 200) {
        commonResponse = commonResponseFromJson(response.bodyString!);
        return commonResponse;
      } else if (response.hasError) {
        return customResponse(500, response.statusText!, response.statusText!);
      } else {
        return customResponse(
            response.statusCode!, response.statusText!, response.bodyString!);
      }
    } catch (e) {
      log(e.toString());
      return customResponse(500, "Failed to send Post", e.toString());
    }
  }
  
  CommonResponse customResponse(int code, String ttl, String msg) {
    return CommonResponse(code: code,title: ttl == "" ? "Internal Server Error" : ttl,data: []);
  }
}
