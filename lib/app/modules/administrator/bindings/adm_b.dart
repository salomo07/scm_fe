import 'package:get/get.dart';
import 'package:scm_fe/app/modules/administrator/controllers/adm_role_c.dart';
import 'package:scm_fe/app/modules/home/controllers/home_c.dart';

class AdministratorBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<HomeController>.put(
        () => HomeController(),
      ),
      BindingsBuilder<AdministratorController>.put(
        () => AdministratorController(),
      )
    ];
  }
}