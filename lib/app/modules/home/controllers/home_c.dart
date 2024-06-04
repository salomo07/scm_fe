import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../constanta/datadummy.dart';
import '../../../constanta/text_style.dart';
import '../../../models/menu.dart';
import 'package:scm_fe/app/middleware/authentication_manager.dart';

import '../../../routes/pages.dart';

class HomeController extends GetxController {
  Rx<double> heightUserImage = 45.0.obs;
  Rx<double> leadingWidth = 120.0.obs;

  RxString urlUserImage = "images/user/userMale.png".obs;
  RxString fullname = "Korban Tabrak Lari".obs;
  RxString rolename = "Web Developer".obs;
  RxBool isSearching = false.obs;
  Rx<Menu> selectedMenu = Menu().obs;
  Rx<Menu> selectedSubMenu = Menu().obs;
  Rx<String> idMenuSelected = "".obs;
  Rx<String> idSubMenuSelected = "".obs;
  RxList<Menu> listMenu = <Menu>[].obs;
  RxList<Widget> menuWidget = <Widget>[].obs;

  
  final AuthenticationManager authenticationManager = Get.find();

  @override
  void onInit() {
    if (!authenticationManager.isLogged.value) {
      Get.rootDelegate.offNamed(Paths.login);
    }
    super.onInit();
  }

  @override
  void onReady() {
    getMenus();
    idMenuSelected.value="000";
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
