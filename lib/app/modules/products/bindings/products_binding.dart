import 'package:get/get.dart';

import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<ProductsController>.put(
        () => ProductsController(),
      )
    ];
  }
}
