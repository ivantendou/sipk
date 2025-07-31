import 'package:get/get.dart';
import 'package:sipk/app/modules/manager_submission/controllers/manager_submission_controller.dart';
import 'package:sipk/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/bottom_nav_manager_controller.dart';

class BottomNavManagerBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put<BottomNavManagerController>(BottomNavManagerController());
    Get.put<ProfileController>(ProfileController());
    Get.put<ManagerSubmissionController>(ManagerSubmissionController());
  }
}
