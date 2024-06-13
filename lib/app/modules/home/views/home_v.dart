import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../routes/pages.dart';
import '../controllers/home_c.dart';
import 'drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.rootDelegate,
      builder: (context, delegate, currentRoute) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: backgroundRoot,
                leading:isDesktop(Get.width)? Container(
                      child: appbarLogo(controller.urlUserImage.value),
                    ):null,
                title: textFieldSearch(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SizedBox(
                      height: 51,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            notifBar(),
                            userBar()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              drawer:!isDesktop(Get.width)? SizedBox(width: 257,child: DrawerWidget()):null,
              body: ColoredBox(
                color: backgroundRoot,
                child: Container(
                  color: backgroundRoot,
                  child: Row(
                    children: [
                      isDesktop(Get.width)? SizedBox(
                        width: 257,
                        child: DrawerWidget(),
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
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  
  Padding appbarLogo(String urlUserImage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Image.network(
        urlUserImage,
        errorBuilder: (context, error, stackTrace) {
          return Lottie.asset("animation/noimage.json");
        },
      ),
    );
  }
  Widget textFieldSearch() {
    return SizedBox(
      width: 200,
      height: 34,
      child: TextFormField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          prefixIcon:
              InkWell(onTap: () {}, child: const Icon(Icons.search)),
          suffixIcon: InkWell(onTap: () {}, child: const Icon(Icons.close)),
          hintText: "Search...",
          // hintStyle: poppinsTextFont.copyWith(fontSize: 12,fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(width: 0.5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xffE3E1E1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: defaultColor),
          )
        )
      ),
    );
  }
  
  Row notifBar() {
    return Row(
      // Untuk icon2, seperti notif, message, task
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.notifications,
              color: defaultColor),
          onPressed: () {},
        ),
        const Gap(10),
        IconButton(
          icon: Icon(Icons.task, color: defaultColor),
          onPressed: () {},
        ),
        const Gap(10),
        IconButton(
          icon: Icon(Icons.message, color: defaultColor),
          onPressed: () {},
        ),
        const Gap(10),
      ],
    );
  }

  InkWell userBar() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            //UserImage
            height: controller.heightUserImage.value,
            width: controller.heightUserImage.value,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                controller.urlUserImage.value,
                errorBuilder: (context, error, stackTrace) {
                  return Lottie.asset("animation/noimage.json");
                },
                width: controller.heightUserImage.value,
                height: controller.heightUserImage.value,
              ),
            ),
          ),
          if (isDesktop(Get.width)) const Gap(10),
          if (isDesktop(Get.width))
          Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Text(controller.fullname.value,style: poppinsTextFont),
              Text(controller.rolename.value,style: poppinsTextFont),
            ],
          )
        ],
      ),
    );
  }
}
