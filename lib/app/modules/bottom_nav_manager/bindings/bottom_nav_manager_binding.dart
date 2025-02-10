import 'package:get/get.dart';

import '../controllers/bottom_nav_manager_controller.dart';

class BottomNavManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavManagerController>(
      () => BottomNavManagerController(),
    );
  }
}
