import 'package:get/get.dart';
import 'package:scm_fe/app/middleware/auth_controller.dart';

import '../routes/pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    AuthController authManager = Get.find();
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));

    if (!authManager.isLogged.value) {
      final newRoute = Paths.LOGIN_THEN(route.currentPage!.name);
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    AuthController authManager = Get.find();
    print(Get.rootDelegate.currentConfiguration);
    if (authManager.isLogged.value && Get.rootDelegate.currentConfiguration==null) {
      print(authManager.isLogged.value);
      return GetNavConfig.fromRoute(Paths.dashboard);
      //NEVER navigate to auth screen, when user is already authed
      return null;

      //OR redirect user to another screen
      //return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}