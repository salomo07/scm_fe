import 'package:get/get.dart';

import '../../shop/controllers/shop_c.dart';
import '../controllers/contact_c.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactController());
  }
}
