import 'package:flutter/material.dart';
import 'package:furniro_fe/const/common_func.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/text_style.dart';
import '../../../middleware/auth_controller.dart';
import '../controllers/home_c.dart';

class DrawerWidget extends GetView<HomeController> {
  DrawerWidget({super.key});
  final AuthController authController =Get.find();

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Obx(() => SizedBox(
        width: 257,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(                    
                  width: 233,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(25),
                      if(!isMobile(Get.width))
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => controller.isDrawerOpened.toggle(),
                          child: const Icon(Icons.expand_circle_down)
                        ),
                      ),
                      Text("Home",style: poppinsTextFont.copyWith(color:Colors.black.withOpacity(0.7),fontSize: 14,fontWeight: FontWeight.w800),),
                      const Gap(10),
                      InkWell(
                        onTap: () {
                          controller.toDashboard();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(5)),
                            color: controller.idMenuSelected.value=="000"? defaultColor:null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [ 
                                Icon(Icons.dashboard,size: 30,color:controller.idMenuSelected.value=="000"?whiteColor:defaultColor,),
                                const Gap(20),
                                Text("Dashboard",style: poppinsTextFont.copyWith(color:controller.idMenuSelected.value=="000"?whiteColor:greyColor,fontSize: 16),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 233,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Menus",style: poppinsTextFont.copyWith(color: Colors.black.withOpacity(0.7),fontSize: 14,fontWeight: FontWeight.w800)),   
                      const Gap(10),
                      const Divider(),
                      SizedBox(
                        height: 300,
                        child: ListView(
                          children: controller.menuWidget,
                        ),
                      )                     
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    authController.logOut();
                  },
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(5)),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                          Icon(Icons.exit_to_app_outlined,size: 20,color:defaultColor,),
                          const Gap(20),
                          Text("Logout",style: poppinsTextFont.copyWith(color:Colors.red,fontSize: 16),)
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      )
    )
    );
  }  
}