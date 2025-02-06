import 'package:get/get.dart';

import '../controllers/manager_submission_detail_controller.dart';

class ManagerSubmissionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerSubmissionDetailController>(
      () => ManagerSubmissionDetailController(),
    );
  }
}
