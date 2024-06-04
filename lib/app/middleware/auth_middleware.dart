import 'package:get/get.dart';
import 'package:scm_fe/app/middleware/authentication_manager.dart';

import '../routes/pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    AuthenticationManager authManager = Get.find();
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
    AuthenticationManager authManager = Get.find();
    if (authManager.isLogged.value) {
      //NEVER navigate to auth screen, when user is already authed
      return null;

      //OR redirect user to another screen
      //return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
