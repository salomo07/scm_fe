import 'package:get/get.dart';
import 'package:scm_fe/app/middleware/cache_manager.dart';
import 'package:scm_fe/app/services/auth_s.dart';

class AuthenticationManager extends GetxController with CacheManager {
  AuthService authService = AuthService();
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String username,String password) async {
    // isLogged.value = true;
    return authService.login(username,password);
    //Token is cached
    // await saveToken(token);
  }

  void checkLoginStatus() {
    // print("checkLoginStatus ${isLogged.value}");
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
