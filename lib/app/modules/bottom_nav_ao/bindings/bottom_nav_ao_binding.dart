import 'package:get/get.dart';

import '../controllers/bottom_nav_ao_controller.dart';

class BottomNavAoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavAoController>(
      () => BottomNavAoController(),
    );
  }
}
