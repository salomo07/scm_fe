import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scm_fe/app/modules/login/views/logintest_v.dart';
import 'package:scm_fe/app/routes/pages.dart';

import '../../home/controllers/home_c.dart';

class LoginViewTest extends GetView<HomeController> {
  const LoginViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    print("LoginViewTest");
    // return LoginForm();
    
    return GetRouterOutlet(
      initialRoute: Paths.loginform,
    );
  }
}
