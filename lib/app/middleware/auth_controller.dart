import 'package:get/get.dart';
import 'package:furniro_fe/app/routes/pages.dart';
import 'package:furniro_fe/const/config_url.dart';
import 'package:furniro_fe/services/service_handler.dart';

import '../../const/common_func.dart';

class AuthController extends GetxController {
  final isLogged = false.obs;
  ServiceHandler serviceHandler=ServiceHandler();
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }


  void logOut() {
    isLogged.value = false;
    removeToken();
    // var token=getToken();
    Get.rootDelegate.offAndToNamed(Paths.login);
  }

  void login(String? token) async {
    isLogged.value = true;
    serviceHandler.requestPost(ConfigURL.login, {"username":"xxxx","password":"dddd"});
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {    
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}