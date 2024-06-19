import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/cart/bindings/cart_b.dart';
import 'package:furniro_fe/app/modules/cart/views/comparation_v.dart';
import 'package:furniro_fe/app/modules/contact/views/contact_v.dart';
import 'package:furniro_fe/app/modules/shop/bindings/shop_b.dart';
import 'package:furniro_fe/app/modules/shop/views/shop_detail_v.dart';
import 'package:furniro_fe/app/modules/shop/views/shop_v.dart';
import 'package:get/get.dart';

import '../../env.dart';
import '../middleware/auth_middleware.dart';
import '../modules/about/bindings/about_b.dart';
import '../modules/about/views/about_v.dart';
import '../modules/administrator/bindings/adm_b.dart';
import '../modules/administrator/views/adm_role_v.dart';
import '../modules/cart/views/cart_v.dart';
import '../modules/cart/views/checkout_v.dart';
import '../modules/contact/bindings/contact_b.dart';
import '../modules/dashboard/bindings/dashboard_b.dart';
import '../modules/dashboard/views/dashboard_v.dart';
import '../modules/dashboard/views/default_v.dart';
import '../modules/dashboard2/bindings/dashboard2_b.dart';
import '../modules/dashboard2/views/dashboard2_v.dart';
import '../modules/home/bindings/home_b.dart';
import '../modules/home/views/home2_v.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_v.dart';
// import '../modules/product_details/bindings/product_details_binding.dart';
// import '../modules/product_details/views/product_details_view.dart';
import '../modules/profile/bindings/profile_b.dart';
import '../modules/profile/views/profile_v.dart';
import '../modules/root/bindings/root_b.dart';
import '../modules/root/views/root_v.dart';
import '../modules/settings/bindings/settings_b.dart';

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
          name: Paths.dashboard2,
          page: () => const Dashboard2View(),
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
              bindings: [DashboardBinding()],
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
              page: () => const Text("settings"),
              bindings: [
                SettingsBinding(),
              ],
            ),
            GetPage(
              name: Paths.administratorRole,
              page: () => AdmRoleView(),
              bindings: AdministratorBinding().dependencies(),
              transition: Transition.size
            ),
          ],
        ),
        GetPage(
          name: Paths.about,
          page: () => const AboutView(),
          transition: Transition.size,
          bindings: [AboutBinding()],
        ),
        GetPage(
          name: Paths.contact,
          page: () => const ContactView(),
          transition: Transition.size,
          bindings: [ContactBinding()],
        ),
        GetPage(
          name: Paths.cart,
          page: () => const CartView(),
          transition: Transition.size,
          bindings: [CartBinding()],
        ),
        GetPage(
          name: Paths.checkout,
          page: () => const CheckoutView(),
          transition: Transition.size,
          bindings: [CartBinding()],
        ),
        GetPage(
          name: Paths.comparation,
          page: () => const ComparationView(),
          transition: Transition.size,
          bindings: [CartBinding()],
        ),
        GetPage(
          name: Paths.shop,
          page: () => const ShopView(),
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
