
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniro_fe/app/routes/pages.dart';
import 'package:furniro_fe/models/detail_product_m.dart';
import 'package:get/get.dart';

import '../../../../const/datadummy.dart';
class ShopController extends GetxController {

  //FURNIRO Project
  Rx<String> idProductEntered="".obs;
  Rx<String> idProductRelatedEntered="".obs;
  RxList<dynamic> listProducts = <dynamic>[].obs;
  RxList<dynamic> listImageRooms = <dynamic>[].obs;
  RxList<dynamic> listImageRelatedProduct = <dynamic>[].obs;
  final ScrollController scrollController = ScrollController();
  Rx<DetailProduct> productDetail = DetailProduct(colors: [],images: [],review: []).obs;
  Rx<String> selectedImage = "".obs;
  Rx<String> selectedSize = "L".obs;
  Rx<String> selectedColor = "".obs;
  Rx<int> selectedQty = 1.obs;

  @override
  void onReady() {
    listProducts.add({"note":"-30%","id":"1","image":"/furniro/images/products/1.png","name":"Syltherine","desc":"Stylish cafe chair","price":"Rp 2.500.000","from":"Rp 3.000.000"});
    listProducts.add({"note":"-50%","id":"2","image":"/furniro/images/products/2.png","name":"Lolito","desc":"Luxury big sofa","price":"Rp 7.000.000","from":"Rp 14.000.000"});
    listProducts.add({"note":"New","id":"3","image":"/furniro/images/products/3.png","name":"Respira","desc":"Outdoor bar table and stool","price":"Rp 500.000","from":""});    
    listProducts.add({"note":"","id":"4","image":"/furniro/images/products/4.png","name":"Grifo","desc":"Night lamp","price":"Rp 1.500.000","from":""});    
    listProducts.add({"note":"New","id":"5","image":"/furniro/images/products/5.png","name":"Muggo","desc":"Small mug","price":"Rp 150.000","from":""});    
    listImageRooms.add({"image":"/furniro/images/background/room1.png"});
    listImageRooms.add({"image":"/furniro/images/background/room2.png"});
    listImageRooms.add({"image":"/furniro/images/background/room3.png"});
    listImageRooms.add({"image":"/furniro/images/background/room4.png"});
    listImageRooms.add({"image":"/furniro/images/background/room5.png"});
    listImageRooms.add({"image":"/furniro/images/background/room3.png"});
    listImageRooms.add({"image":"/furniro/images/background/room1.png"});
    listImageRooms.add({"image":"/furniro/images/background/room2.png"});
    super.onReady();
  }
  getDetailProduct(String id){
    Future.delayed(const Duration(seconds: 1),() {
      productDetail.value=detailProductFromJson(json.encode(dataDetailProducts));
    },);
    selectedImage.value="";
  }
  getRelatedProduct(){    
    Future.delayed(const Duration(seconds: 1),() {
      listImageRelatedProduct.add({"note":"New","id":"3","image":"/furniro/images/products/3.png","name":"Respira","desc":"Outdoor bar table and stool","price":"Rp 500.000","from":""});
      listImageRelatedProduct.add({"note":"-50%","id":"2","image":"/furniro/images/products/2.png","name":"Lolito","desc":"Luxury big sofa","price":"Rp 7.000.000","from":"Rp 14.000.000"});
      listImageRelatedProduct.add({"note":"New","id":"5","image":"/furniro/images/products/5.png","name":"Muggo","desc":"Small mug","price":"Rp 150.000","from":""}); 
      listImageRelatedProduct.add({"note":"-30%","id":"1","image":"/furniro/images/products/1.png","name":"Syltherine","desc":"Stylish cafe chair","price":"Rp 2.500.000","from":"Rp 3.000.000"});
      listImageRelatedProduct.add({"note":"","id":"4","image":"/furniro/images/products/4.png","name":"Grifo","desc":"Night lamp","price":"Rp 1.500.000","from":""});
    },);
  }
  addToCart(String id){
    
  }
  addToCompare(String id){
    
  }
  void toDetailProduct(dynamic data){
    Get.rootDelegate.toNamed('${Paths.shop}/${data["id"]}');    
  }
  
}