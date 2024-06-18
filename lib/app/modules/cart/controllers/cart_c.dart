import 'package:get/get.dart';

import '../../../routes/pages.dart';

class CartController extends GetxController {
  Rx<String> idProductEntered="".obs;
  void toDetailProduct(dynamic data){
    Get.rootDelegate.toNamed('${Paths.shop}/${data["id"]}');    
  }
}