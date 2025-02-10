import 'package:get/get.dart';

import '../controllers/submission_data_controller.dart';

class SubmissionDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmissionDataController>(
      () => SubmissionDataController(),
    );
  }
}
