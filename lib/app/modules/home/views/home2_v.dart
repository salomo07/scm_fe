import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniro_fe/widgets/custom_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../routes/pages.dart';
import '../controllers/home_c.dart';
import 'drawer.dart';

class Home2View extends GetView<HomeController> {
  const Home2View({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.rootDelegate,
      builder: (context, delegate, currentRoute) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: appbarCustom(),
              drawer:!isDesktop(Get.width)? SizedBox(width: 257,child: DrawerWidget()):null,
              body: ColoredBox(
                color: whiteColor,
                child: Obx(() => Container(
                  color: Colors.transparent,
                  child: controller.isDrawerOpened.value? 
                  Row(
                    children: [
                      isDesktop(Get.width)? SizedBox(
                        width: 257,
                        child:  DrawerWidget(),
                      ):
                      const Center(),
                      Expanded(
                        flex: 4,
                        child :GetRouterOutlet.builder(
                          builder: (context, delegate, currentRoute) {
                            return GetRouterOutlet(
                              initialRoute: Paths.dashboard2,
                              key: Get.nestedKey(Paths.home)
                            );
                          },
                        )
                      ),
                    ],
                  ):
                  Stack(
                    children: [
                      GetRouterOutlet.builder(
                        builder: (context, delegate, currentRoute) {
                          return GetRouterOutlet(
                            initialRoute: Paths.dashboard2,
                            key: Get.nestedKey(Paths.home)
                          );
                        },
                      ),
                      // if(controller.isRightMenuOpened.value)
                      Visibility(
                        visible: controller.isRightMenuOpened.value,
                        child: AnimatedOpacity(
                          opacity: controller.isRightMenuOpened.value ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // if(controller.isRightMenuOpened.value)
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        right: controller.isRightMenuOpened.value ? 0 : -417,
                        top: 0,
                        child: Opacity(
                          opacity: controller.isRightMenuOpened.value ? 1 : 0,
                          child: IgnorePointer(
                            ignoring: !controller.isRightMenuOpened.value,
                            child: Material(
                              elevation: 80,
                              borderRadius: BorderRadius.circular(8),
                              child: cartMenu(),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),),
              ),
            );
          },
        );
      },
    );
  }

  Container cartMenu() {
    return Container(
      color: whiteColor,
      width: 417,
      height: 420,
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shopping Cart",style: poppins24_600(),),
                IconButton(onPressed: () {
                  controller.isRightMenuOpened.value=false;
                }, icon: const Icon(Icons.close))
              ],
            ),
            const Divider(),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset("/furniro/images/background/room1.png",fit: BoxFit.fill, height: 105,width: 105,)),
                Column(
                  children: [
                    Text("Asgaard sofa",style: poppins16_400(),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("1",style: poppins16_300(),),
                        const Gap(10),
                        Text("X",style: poppins12_300(),),
                        const Gap(10),
                        Text("Rp. 3.000.000",style: poppins12_500().copyWith(color: defaultColor),)
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                  
                  },
                  icon: const Icon(Icons.delete)
                )
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal",style: poppins16_400(),),
                    Text("Rp. 2.000.000",style: poppins16_600().copyWith(color: defaultColor),),
                  ],
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  textStyle: poppins12_500().copyWith(color: blackColor2),
                  colorButton: whiteColor,
                  colorBorder: blackColor2,
                  borderRadius: 50,
                  width: 87,
                  text:"Cart" , 
                  onPressed: () {
                    Get.rootDelegate.toNamed(Paths.cart);
                  },
                ),
                CustomButton(
                  textStyle: poppins12_500().copyWith(color: blackColor2),
                  colorButton: whiteColor,
                  colorBorder: blackColor2,
                  borderRadius: 50,
                  width: 118,
                  text:"Checkout" , 
                  onPressed: () {
                    
                  },
                ),
                CustomButton(
                  textStyle: poppins12_500().copyWith(color: blackColor2),
                  colorButton: whiteColor,
                  colorBorder: blackColor2,
                  borderRadius: 50,
                  width: 135,
                  text:"Comparation" , 
                  onPressed: () {
                    
                  },
                ),
              ],
            )
          ],   
        ),
      ),
    );
  }
  
  AppBar appbarCustom() {
    return AppBar(            
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if(isDesktop(Get.width)){
                        controller.isDrawerOpened.toggle();
                      }else{
                        Get.rootDelegate.toNamed(Paths.home);
                      }                      
                    },
                    child: Image.asset("/furniro/images/logo/logo.png",
                      height: 32,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Gap(10),
                  isDesktop(Get.width)?
                  InkWell(
                    onTap: () {
                      Get.rootDelegate.toNamed(Paths.home);
                    }, 
                    child: Text("Furniro",style: montserrat34_700(),)
                  ):const Text("")
                ],                      
              ),
              if (isDesktop(Get.width))
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Paths.home);
                    },
                    child: Text("Home",style: poppins16_500().copyWith(color: Colors.black))
                  ),
                  const Gap(40),
                  TextButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Paths.shop);
                    },
                    child: Text("Shop",style: poppins16_500().copyWith(color: Colors.black))
                  ),
                  const Gap(40),
                  TextButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Paths.about);
                    },
                    child: Text("About",style: poppins16_500().copyWith(color: Colors.black))),
                  const Gap(40),
                  TextButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(Paths.about);
                    }, 
                    child: Text("Contact",style: poppins16_500().copyWith(color: Colors.black))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(CupertinoIcons.person)),
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.search_sharp)),
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(CupertinoIcons.heart)),
                  IconButton(onPressed: () {
                    controller.isRightMenuOpened.toggle();
                  }, icon: const Icon(CupertinoIcons.cart)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
