import 'package:get/get.dart';

import '../../root/controllers/root_c.dart';
import '../controllers/dashboard_c.dart';

class DashboardBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<DashboardController>.put(
        () => DashboardController(),
      ),
      BindingsBuilder<RootController>.put(
        () => RootController(),
      )     
    ];
  }
}
