import 'package:get/get.dart';
import 'package:sipk/app/modules/ao_home/controllers/ao_home_controller.dart';
import 'package:sipk/app/modules/ao_manage_data/controllers/ao_manage_data_controller.dart';
import 'package:sipk/app/modules/ao_submission/controllers/ao_submission_controller.dart';
import 'package:sipk/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/bottom_nav_ao_controller.dart';

class BottomNavAoBinding extends Bindings {
  @override
  @override
  void dependencies() {
    Get.put<BottomNavAoController>(BottomNavAoController());
    Get.put<AoHomeController>(AoHomeController());
    Get.put<AoSubmissionController>(AoSubmissionController());
    Get.put<AoManageDataController>(AoManageDataController());
    Get.put<ProfileController>(ProfileController());
  }
}
