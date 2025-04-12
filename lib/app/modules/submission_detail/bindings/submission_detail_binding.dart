import 'package:get/get.dart';

import '../controllers/submission_detail_controller.dart';

class SubmissionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmissionDetailController>(
      () => SubmissionDetailController(),
    );
  }
}
