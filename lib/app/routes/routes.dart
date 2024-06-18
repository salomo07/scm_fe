// ignore_for_file: non_constant_identifier_names

part of 'pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Paths {
  static const root = '/';
  static const home = '/home';
  
  static const notfound = '/404';
  static const about = '$home/about';
  static const cart = '$home/cart';
  static const checkout = '$home/checkout';
  static const comparation = '$home/comparation';

  static const contact = '$home/contact';


  static const shop = '$home/shop';
  static const shopList = '/shop-list';

  static const dashboard = '$home/dashboard';
  static const dashboard2 = '$home/dashboard2';


  static const transaction = '$home/transaction';
  static const transactionin = '$home/www';

  static const products = '/products';
  static const productDetails = '/products/details';
  static const profile ='/profile';

  static const administratorRole = '/administrator/role';
  static const administratorUser ='/administrator/user';

  static const login = '/login';
  static const loginform = '$login/loginform';
  static const registerform='$login/registerform';
  
  static const settings = '/settings';


  Paths._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}