import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/pages.dart';
import '../controllers/root_c.dart';
import 'drawer.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: GetRouterOutlet(
        initialRoute: Paths.login,
        anchorRoute: '/',
      ),
    );
  }
}
