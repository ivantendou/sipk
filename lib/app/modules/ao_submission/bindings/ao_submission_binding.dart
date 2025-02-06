import 'package:get/get.dart';

import '../controllers/ao_submission_controller.dart';

class AoSubmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoSubmissionController>(
      () => AoSubmissionController(),
    );
  }
}
