import 'package:get/get.dart';

import '../controllers/dashboard2_c.dart';

class Dashboard2Binding extends Bindings{
  @override
  void dependencies() {
    Get.put(Dashboard2Controller());
  }
}