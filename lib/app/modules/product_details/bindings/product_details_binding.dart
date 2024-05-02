import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<ProductDetailsController>.put(
        () => ProductDetailsController(Get.parameters['productId'] ?? '',),
      )
    ];
  }
}
