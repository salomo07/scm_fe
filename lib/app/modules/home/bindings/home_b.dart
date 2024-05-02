import 'package:get/get.dart';
import 'package:scm_fe/app/modules/root/controllers/root_c.dart';

import '../controllers/home_c.dart';

class HomeBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<HomeController>.put(
        () => HomeController(),
      ),
      BindingsBuilder<RootController>.put(
        () => RootController(),
      )
    ];
  }
}
