import 'package:get/get.dart';
import '../middleware/auth_controller.dart';
import '../routes/pages.dart';

class EnsureAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    AuthController authController = Get.find();
    // print("EnsureAuthedMiddleware ${authController.isLogged.value} ${route.currentPage!.name}");
    String? thenTo;
    if(route.currentPage!.name==Paths.root)
    if(Get.rootDelegate.currentConfiguration!=null&&Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then']!=null)
    {
      print("1");
      thenTo = Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    }else if (!authController.isLogged.value && thenTo!=null) {
      print("2");
      final newRoute = Paths.LOGIN_THEN(route.currentPage!.name);
      return GetNavConfig.fromRoute(newRoute);
    }
    print("3 ${route.currentPage!.name}");
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    AuthController authController = Get.find();
    print("EnsureNotAuthedMiddleware ${authController.isLogged.value} ${Get.rootDelegate.currentConfiguration}");
    if (authController.isLogged.value && Get.rootDelegate.currentConfiguration==null) {
      return GetNavConfig.fromRoute(Paths.dashboard);
    }
    else if(!authController.isLogged.value && Get.rootDelegate.currentConfiguration==null){
      print("Kedua");
      return GetNavConfig.fromRoute(Paths.login);
    }
    print("Ketiga $route");
    return await super.redirectDelegate(route);
  }
}