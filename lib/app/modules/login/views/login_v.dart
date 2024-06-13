import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:form_validator/form_validator.dart';

import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../../env.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textformfield.dart';
import '../../../routes/pages.dart';
import '../controllers/login_c.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


part 'login_form.dart';
part 'registration_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(Get.width)) {} 
        else if (isTablet(Get.width)) {} 
        else {}
    
        if (!isMobile(Get.width)) {
          controller.screenWidth.value = Get.width;
          controller.halfScreenWidth.value = Get.width / 2;
        }
    
        return SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: !isMobile(Get.width)? controller.halfScreenWidth.value: double.infinity,
                height: isMobile(Get.width)? Get.height * 0.25 : Get.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: CarouselSlider(
                    items: controller.imgList.map((item) => 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          errorBuilder: (context, error, stackTrace) {
                            return Lottie.asset("assets/animation/noimage.json",height:isMobile(Get.width) ? Get.height * 0.2 : Get.height);
                          }, 
                          item,
                          fit: BoxFit.cover 
                        ),
                      )
                    ).toList(), 
                    options: CarouselOptions(
                      autoPlay: true,
                      padEnds: true,
                      aspectRatio: 1/2,
                      viewportFraction:1,
                      enableInfiniteScroll: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                    )
                  ),
                ),
              ),
              SizedBox(
                width: !isMobile(Get.width)?controller.halfScreenWidth.value:double.infinity,
                height: Get.height,
                child: const LoginForm(),
              )
            ],
          ),
        );
      },
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.radius,
  });
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2 * radius,
      height: 2 * radius,
      decoration: BoxDecoration(
        border: Border.all(width: 20, color: defaultColor.withOpacity(0.2)),
        shape: BoxShape.circle,
      ),
    );
  }
}
