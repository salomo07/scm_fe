import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<SettingsController>.put(
        () => SettingsController(),
      )
    ];
  }
}
