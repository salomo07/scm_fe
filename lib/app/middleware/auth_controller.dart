import 'package:get/get.dart';

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
  }

  void login(String? token) async {
    isLogged.value = true;
    print("isLogged ${isLogged.value}");
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {    
    final token = getToken();
    print("checkLoginStatus $token");
    if (token != null) {
      isLogged.value = true;
    }
  }
}