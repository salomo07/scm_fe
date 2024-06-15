import 'package:get/get.dart';

import '../../root/controllers/root_c.dart';
import '../controllers/dashboard_c.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(RootController());
  }
}
