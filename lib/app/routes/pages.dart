import 'package:get/get.dart';
import '../middleware/auth_middleware.dart';
import '../modules/dashboard/bindings/dashboard_b.dart';
import '../modules/dashboard/views/dashboard_v.dart';
import '../modules/home/bindings/home_b.dart';
import '../modules/home/views/home_v.dart';
import '../modules/login/bindings/login_b.dart';
import '../modules/login/views/login_v.dart';
import '../modules/profile/bindings/profile_b.dart';
import '../modules/profile/views/profile_v.dart';
import '../modules/root/bindings/root_b.dart';
import '../modules/root/views/root_v.dart';
import '../modules/settings/bindings/settings_b.dart';
import '../modules/settings/views/settings_v.dart';
part 'routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      bindings: RootBinding().dependencies(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware(),
          ],
          name: Paths.login,
          page: () => const LoginView(),
          bindings: LoginBinding().dependencies(),
        ),
        GetPage(
          preventDuplicates: true,
          name: Paths.home,
          page: () => const HomeView(),
          bindings:HomeBinding().dependencies(),
          title: null,
          children: [
            GetPage(
              name: Paths.dashboard,
              page: () => const DashboardView(),
              bindings: DashboardBinding().dependencies(),
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: Paths.profile,
              page: () => const ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              bindings:ProfileBinding().dependencies(),
            ),
          ],
        ),
        GetPage(
          name: Paths.settings,
          page: () => const SettingsView(),
          bindings:SettingsBinding().dependencies(),
        ),
      ],
    ),
  ];
}
