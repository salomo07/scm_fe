import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniro_fe/const/common_func.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/datadummy.dart';
import '../../../../const/text_style.dart';
import '../../../../models/detail_product_m.dart';
import '../../../../models/menu.dart';
import '../../../middleware/auth_controller.dart';
import '../../../routes/pages.dart';
// import '../../auth/controllers/auth_c.dart';

class HomeController extends GetxController {
  Rx<double> heightUserImage = 45.0.obs;
  Rx<double> leadingWidth = 120.0.obs;

  RxString urlUserImage = "images/user/userMale.png".obs;
  RxString fullname = "Korban Tabrak Lari".obs;
  RxString rolename = "Web Developer".obs;
  RxBool isSearching = false.obs;
  RxBool isDrawerOpened = false.obs;
  Rx<Menu> selectedMenu = Menu().obs;
  Rx<int> selectedIndexMenu = 0.obs;
  Rx<Menu> selectedSubMenu = Menu().obs;
  Rx<String> idMenuSelected = "".obs;
  Rx<String> idSubMenuSelected = "".obs;
  RxList<Menu> listMenu = <Menu>[].obs;
  RxList<Widget> menuWidget = <Widget>[].obs;
  Rx<bool> isRightMenuOpened = false.obs;
  RxList<DetailProduct> listtProductCart = <DetailProduct>[].obs;
  
  final AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    if (!authController.isLogged.value) {
      Get.rootDelegate.offNamed(Paths.login);
    }
    super.onInit();
  }

  @override
  void onReady() {
    getMenus();
    idMenuSelected.value="000";
    getItemCart();
    super.onReady();
  }
  
  void getMenus() {
    List<Widget> menus = [];
    listMenu.value = menuFromJson(json.encode(dataMenu));
    for (var e in listMenu) {
      menus.add(createWidgetMenus(e));
      menus.add(const Divider());
    }
    menuWidget.value = menus;
  }
  toDashboard(){
    idMenuSelected.value="000";
    selectedMenu.value=Menu(idMenu: '000',path: Paths.dashboard);
    Get.rootDelegate.toNamed(Paths.dashboard);
  }
  getItemCart(){
    var jsonCart=getHive("cart");
    if(jsonCart!=null){
      Future.delayed(const Duration(seconds: 1),() {
        // listtProductCart.value=detailProductFromJson(json.encode(dataDetailProducts));
      },);
    }
  }
  Widget createWidgetMenus(Menu menu) {
    bool isMenuHaveSubmenu = menu.subMenu != null && menu.subMenu!.isNotEmpty ? true : false;
    return InkWell(
      onTap: () { //MenuClick
        if(!isMenuHaveSubmenu){
          selectedMenu.value=menu;
          idMenuSelected.value=menu.idMenu!;
          Get.rootDelegate.toNamed(menu.path!);
        }
        if(menu.path!=null){
          selectedMenu.value = menu;
          idSubMenuSelected.value = "";          
          selectedSubMenu.value =Menu();    
          idSubMenuSelected.value = "";
        }else if(menu.path==null){  //Jika punya submenu
          selectedMenu.value=Menu();
        }
        idMenuSelected.value = menu.idMenu!;
      },
      child: Obx(() => 
        isMenuHaveSubmenu? 
        Column(
          children: generateExpandMenu(menu),
        )
        : 
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: idMenuSelected.value==menu.idMenu?defaultColor:null
          ),
          child: Padding(  //Jika tanpa submenu
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(iconMap[menu.iconCode],
                  size: 20,
                  color: menu.idMenu==idMenuSelected.value?whiteColor:defaultColor
                ),
                const Gap(20),
                Text(
                  menu.label!,
                  style: poppinsTextFont.copyWith(color: idMenuSelected.value == menu.idMenu? whiteColor: greyColor,fontSize: 16),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
  generateExpandMenu(Menu menu) {
    var lineMenu = <Widget>[
      Obx(() => 
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: idMenuSelected.value == menu.idMenu ? defaultColor : null,
          ),
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(iconMap[menu.iconCode],
                        size: 20,
                        color: idMenuSelected.value == menu.idMenu
                            ? whiteColor
                            : defaultColor),
                    const Gap(20),
                    Text(
                      menu.label!,
                      style: poppinsTextFont.copyWith(color: idMenuSelected.value == menu.idMenu? whiteColor: greyColor,fontSize: 16),
                    ),
                  ],
                ),
                if (idMenuSelected.value == menu.idMenu)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_right_sharp,size: 20,color: idMenuSelected.value == menu.idMenu? whiteColor:defaultColor)
                  ),
                if (idMenuSelected.value != menu.idMenu)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                      color: idMenuSelected.value == menu.idMenu? whiteColor: defaultColor
                    )
                  ),
              ],
            ),
          ),
        )
      )
    ];
    lineMenu.add(const Gap(5));
    for (var element in menu.subMenu!) {
      if (idMenuSelected.value == menu.idMenu) {
        lineMenu.add(
          GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              return InkWell( //SubMenuClick
                onTap: () {
                  idSubMenuSelected.value=element.idMenu!;
                  selectedSubMenu.value=element;
                  Get.rootDelegate.toNamed(element.path!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: idSubMenuSelected.value == element.idMenu ? defaultColor.withOpacity(0.5) : null,
                  ),
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(iconMap[menu.iconCode],size: 20, color: idSubMenuSelected.value==element.idMenu?whiteColor: defaultColor),
                        const Gap(20),
                        Text(
                          element.label!,
                          style: poppinsTextFont.copyWith(
                              color:idSubMenuSelected.value==element.idMenu? whiteColor:greyColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        );
      }
    }
    return lineMenu;
  }
}
