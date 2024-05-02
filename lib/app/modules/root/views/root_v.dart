import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../routes/pages.dart';
import '../../home/views/drawer.dart';
import '../controllers/root_c.dart';


class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.delegate(),
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Paths.login,
            delegate: Get.delegate(),
            anchorRoute: Paths.root,
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}