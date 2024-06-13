import 'package:get/get.dart';

import '../../home/controllers/home_c.dart';
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
