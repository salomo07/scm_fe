import 'package:get/get.dart';

import '../../shop/controllers/shop_c.dart';
import '../controllers/cart_c.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(ShopController());
  }
}
