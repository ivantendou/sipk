import 'package:get/get.dart';

import '../controllers/bottom_nav_admin_controller.dart';

class BottomNavAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavAdminController>(
      () => BottomNavAdminController(),
    );
  }
}
