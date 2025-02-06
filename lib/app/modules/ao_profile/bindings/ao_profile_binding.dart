import 'package:get/get.dart';

import '../controllers/ao_profile_controller.dart';

class AoProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoProfileController>(
      () => AoProfileController(),
    );
  }
}
