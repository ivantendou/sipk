import 'package:get/get.dart';

import '../controllers/manager_submission_controller.dart';

class ManagerSubmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerSubmissionController>(
      () => ManagerSubmissionController(),
    );
  }
}
