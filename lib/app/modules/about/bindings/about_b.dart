import 'package:furniro_fe/app/modules/about/controllers/about_c.dart';
import 'package:get/get.dart';

import '../../root/controllers/root_c.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutController());
  }
}
