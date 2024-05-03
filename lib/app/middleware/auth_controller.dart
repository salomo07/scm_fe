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
    Get.rootDelegate.offNamed(Paths.login);
  }

  void login(String? token) async {
    isLogged.value = true;
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