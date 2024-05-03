import 'package:get/get.dart';
import 'package:scm_fe/app/middleware/auth_controller.dart';

import '../routes/pages.dart';
AuthController authController =AuthController();

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));
    print("EnsureAuthMiddleware ${!authController.isLogged.value} ${route.currentPage!.name}");
    var thenTo;
    if(Get.rootDelegate.currentConfiguration!=null&&Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then']!=null)
    {
      thenTo = Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    }
    if (!authController.isLogged.value && thenTo!=null) {
      print("if");
      final newRoute = Paths.LOGIN_THEN(route.currentPage!.name);
      return GetNavConfig.fromRoute(newRoute);
    }
    print("Else");
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    print("EnsureNotAuthedMiddleware ${authController.isLogged.value}");
    if (authController.isLogged.value) {
      //NEVER navigate to auth screen, when user is already authed
      print("EnsureNotAuthedMiddleware ${authController.isLogged.value}");
      return null;
      
      //OR redirect user to another screen
      //return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
