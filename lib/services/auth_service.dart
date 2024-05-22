import 'package:get/get.dart';
import 'package:scm_fe/const/config_url.dart';
import 'package:scm_fe/services/service_handler.dart';

import '../models/common_response.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  ServiceHandler serviceHandler = ServiceHandler();
  /// Mocks a login process
  final isLoggedIn = true.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  Future<CommonResponse> login(dynamic payload) async {
    isLoggedIn.value = true;
    var xxx= await serviceHandler.requestPost(ConfigURL.login, payload);
    return xxx;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
