import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scm_fe/app/modules/profile/views/profile_v.dart';
import 'package:scm_fe/env.dart';

import '../middleware/auth_middleware.dart';
import '../modules/dashboard/bindings/dashboard_b.dart';
import '../modules/dashboard/views/dashboard_v.dart';
import '../modules/dashboard/views/default_v copy.dart';
import '../modules/home/bindings/home_b.dart';
import '../modules/home/views/home_v.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_v.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/views/products_view.dart';
import '../modules/profile/bindings/profile_b.dart';
import '../modules/root/bindings/root_b.dart';
import '../modules/root/views/root_v.dart';
import '../modules/settings/bindings/settings_b.dart';
import '../modules/settings/views/settings_view.dart';

part 'routes.dart';

class Pages {
  Pages._();

  static const initial = Paths.home;

  static final allPages = [    
    GetPage(
      name: Paths.root,
      page: () => const RootView(),
      bindings: RootBinding().dependencies(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [        
        GetPage(          
          name: Paths.login,
          middlewares: [
            EnsureNotAuthedMiddleware(),
          ],
          page: () => const LoginView(),
          bindings: LoginBinding().dependencies(),
          children: [
            GetPage(
              name: Paths.loginform, 
              page: () => const LoginForm(),
              bindings: LoginBinding().dependencies(),
              transition: Transition.rightToLeftWithFade
            ),
            GetPage(
              name: Paths.registerform, 
              page: () => const RegistrationForm(),
              transition: Transition.leftToRightWithFade
            ),
          ]
        ),
        GetPage(
          name: Paths.dashboard,
          middlewares: [
            EnsureAuthedMiddleware(),
          ],
          page: () => const DashboardView(),
          bindings: DashboardBinding().dependencies(),
        ),
        GetPage(          
          name: Paths.home,
          preventDuplicates: true,
          page: () => const HomeView(),
          bindings: HomeBinding().dependencies(),
          middlewares: [
            EnsureAuthedMiddleware(),
          ],
          title: appName,
          children: [
            GetPage(
              name: Paths.dashboard,
              page: () => const DashboardView(),
              bindings: DashboardBinding().dependencies(),
            ),
            GetPage(
              name: Paths.notfound,
              page: () => const DefaultView()
            ),
            // GetPage(
            //   name: Paths.dashboard,
            //   page: () => const DashboardView(),
            //   bindings: DashboardBinding().dependencies(),
            // ),
            GetPage(
              name: '/default',
              page: () => const DefaultView(),
              bindings: DashboardBinding().dependencies(),
            ),
            GetPage(
              // middlewares: [
              //   EnsureAuthMiddleware(),
              // ],
              name: Paths.profile,
              page: () => const ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              bindings: [ProfileBinding()],
            ),
            GetPage(
              name: Paths.settings, 
              page: () => Text("Setting"),
              transition: Transition.rightToLeftWithFade
            ),
            GetPage(
              name: Paths.products,
              page: () => const ProductsView(),
              title: 'Products',
              transition: Transition.cupertino,
              showCupertinoParallax: true,
              participatesInRootNavigator: false,
              bindings: [ProductsBinding(), ProductDetailsBinding()],
              children: [
                GetPage(
                  name: Paths.productDetails,
                  transition: Transition.cupertino,
                  showCupertinoParallax: true,
                  page: () => const ProductDetailsView(),
                  bindings: const [],
                  // middlewares: [
                  //   //only enter this route when authed
                  //   EnsureAuthMiddleware(),
                  // ],
                ),
              ],
            ),
          ],
        ),
        GetPage(
          name: Paths.settings,
          page: () => const SettingsView(),
          bindings: [
            SettingsBinding(),
          ],
        ),
      ],
    ),
  ];
}
