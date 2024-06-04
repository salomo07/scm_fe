import 'package:get/get.dart';

import '../controllers/profile_c.dart';

class ProfileBinding extends Bindings {
  @override
  List<Bindings> dependencies() {
    return [
      BindingsBuilder<ProfileController>.put(
        () => ProfileController(),
      )
    ];
  }
}
