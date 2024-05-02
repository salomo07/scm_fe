import 'package:get/get.dart';

import '../controllers/login_c.dart';

class LoginBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<LoginController>.put(
        () => LoginController(),
      )
    ];
  }
}
