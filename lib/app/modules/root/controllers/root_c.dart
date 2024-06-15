
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/menu.dart';
class RootController extends GetxController {

  Rx<double> heightUserImage = 45.0.obs;
  Rx<double> leadingWidth = 120.0.obs;

  RxString urlUserImage = "images/user/userMale.png".obs;
  RxString fullname = "Korban Tabrak Lari".obs;
  RxString rolename = "Web Developer".obs;
  RxBool isSearching = false.obs;
  Rx<Menu> selectedMenu = Menu().obs;
  Rx<Menu> selectedSubMenu = Menu().obs;
  Rx<String> idMenuSelected = "".obs;
  // Rx<String> selectedPath = "${Paths.home}${Paths.dashboard}".obs;
  Rx<String> selectedPath = "/home/settings".obs;
  Rx<String> idSubMenuSelected = "".obs;
  RxList<Menu> listMenu = <Menu>[].obs;
  RxList<Widget> menuWidget = <Widget>[].obs;
  Rx<String> anchorPath="/".obs;

  
}
