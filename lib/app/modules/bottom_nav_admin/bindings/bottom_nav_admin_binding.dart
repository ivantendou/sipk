import 'package:get/get.dart';
import 'package:sipk/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/bottom_nav_admin_controller.dart';

class BottomNavAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavAdminController>(BottomNavAdminController());
    Get.put<ProfileController>(ProfileController());
  }
}
