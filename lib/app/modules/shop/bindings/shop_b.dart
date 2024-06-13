
import 'package:get/get.dart';

import '../controllers/shop_c.dart';

class ShopBinding extends Bindings{
  
  @override
  void dependencies() {
    Get.put(ShopController());
  }
}