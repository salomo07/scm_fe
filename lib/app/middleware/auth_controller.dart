import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scm_fe/app/routes/pages.dart';

import '../../const/common_func.dart';

class AuthController extends GetxController {
  final isLogged = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }


  void logOut() {
    isLogged.value = false;
    removeToken();
    var token=getToken();
    print("token $token");
    Get.rootDelegate.offAndToNamed(Paths.login);
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {    
    final token = getToken();
    print("token $token");
    if (token != null) {
      isLogged.value = true;
    }
  }
}