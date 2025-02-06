import 'package:get/get.dart';

import '../controllers/ao_bottom_nav_controller.dart';

class BottomNavAoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoBottomNavController>(
      () => AoBottomNavController(),
    );
  }
}
