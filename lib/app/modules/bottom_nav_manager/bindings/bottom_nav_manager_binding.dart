import 'package:get/get.dart';
import 'package:sipk/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/bottom_nav_manager_controller.dart';

class BottomNavManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavManagerController>(BottomNavManagerController());
    Get.put<ProfileController>(ProfileController());
  }
}
