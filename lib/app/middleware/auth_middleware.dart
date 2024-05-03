import 'package:get/get.dart';
import 'package:scm_fe/app/middleware/auth_controller.dart';

import '../routes/pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    AuthController authController = Get.find();
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
    if (authManager.isLogged.value && Get.rootDelegate.currentConfiguration==null) {
      return GetNavConfig.fromRoute(Paths.dashboard);
    }
    return await super.redirectDelegate(route);
  }
}