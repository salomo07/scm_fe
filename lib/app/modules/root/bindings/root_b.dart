import 'package:get/get.dart';
import 'package:scm_fe/app/modules/home/controllers/home_c.dart';

import '../controllers/root_c.dart';

class RootBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<RootController>.put(
        () => RootController(),
      ),
      BindingsBuilder<HomeController>.put(
        () => HomeController(),
      )
    ];
  }
}
