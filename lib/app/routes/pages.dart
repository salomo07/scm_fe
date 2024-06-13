import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/shop/bindings/shop_b.dart';
import 'package:furniro_fe/app/modules/shop/views/shop_detail_v.dart';
import 'package:furniro_fe/app/modules/shop/views/shop_v.dart';
import 'package:get/get.dart';

import '../../env.dart';
import '../middleware/auth_middleware.dart';
import '../modules/administrator/bindings/adm_b.dart';
import '../modules/administrator/views/adm_role_v.dart';
import '../modules/dashboard/bindings/dashboard_b.dart';
import '../modules/dashboard/views/dashboard_v.dart';
import '../modules/dashboard/views/default_v copy.dart';
import '../modules/dashboard2/bindings/dashboard2_b.dart';
import '../modules/dashboard2/views/dashboard2_v.dart';
import '../modules/home/bindings/home_b.dart';
import '../modules/home/views/home2_v.dart';
import '../modules/home/views/home_v.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_v.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/profile/bindings/profile_b.dart';
import '../modules/profile/views/profile_v.dart';
import '../modules/root/bindings/root_b.dart';
import '../modules/root/views/root_v.dart';
import '../modules/settings/bindings/settings_b.dart';
import '../modules/settings/views/settings_v.dart';

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
        // GetPage(
        //   name: Paths.dashboard,
        //   middlewares: [
        //     EnsureAuthedMiddleware(),
        //   ],
        //   page: () => const DashboardView(),
        //   bindings: DashboardBinding().dependencies(),
        // ),
        GetPage(
          name: Paths.dashboard2,
          page: () => Dashboard2View(),
          bindings: [Dashboard2Binding()],
        ),
        GetPage(          
          name: Paths.home,
          preventDuplicates: true,
          page: () => const Home2View(),
          bindings: HomeBinding().dependencies(),
          middlewares: [
            EnsureAuthedMiddleware(),
          ],
          title: appName,
          children: [
            GetPage(
              name: Paths.dashboard,
              page: () => const DashboardView(),
              bindings: [DashboardBinding()],
            ),
            GetPage(
              name: Paths.notfound,
              page: () => const DefaultView()
            ),
            GetPage(
              name: '/default',
              page: () => const DefaultView(),
              bindings: DashboardBinding().dependencies(),
            ),
            GetPage(
              name: Paths.profile,
              page: () => const ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              bindings: [ProfileBinding()],
            ),
            GetPage(
              name: Paths.settings,
              page: () => const Text("ssss"),
              bindings: [
                SettingsBinding(),
              ],
            ),
            // GetPage(
            //   name: Paths.shop,
            //   page: () => ShopView(),
            //   transition: Transition.size,
            //   bindings: [ShopBinding()],
            //   children: [
            //     GetPage(
            //       name: Paths.shopList,
            //       page: () => Text("List"),
            //       bindings: [ShopBinding()],
            //     )
            //   ]
            // ),
            GetPage(
              name: Paths.administratorRole,
              page: () => AdmRoleView(),
              bindings: AdministratorBinding().dependencies(),
              transition: Transition.size
            ),
          ],
        ),
        GetPage(
          name: Paths.shop,
          page: () => ShopView(),
          transition: Transition.size,
          bindings: [ShopBinding()],
          children: [
            GetPage(
              name: "/shop-list",
              page: () => const ShopListView(),
              bindings: [ShopBinding()],
            ),
            GetPage(
              name: "/:id",
              page: () => const ShopDetailView(),
              bindings: [ShopBinding()],
            )
          ]
        ),
      ],
    ),
  ];
}
