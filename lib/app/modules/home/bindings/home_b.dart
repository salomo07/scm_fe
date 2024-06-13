import 'package:get/get.dart';

import '../../root/controllers/root_c.dart';
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
