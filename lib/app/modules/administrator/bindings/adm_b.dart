import 'package:get/get.dart';

import '../../home/controllers/home_c.dart';
import '../controllers/adm_role_c.dart';

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