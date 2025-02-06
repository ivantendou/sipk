import 'package:get/get.dart';

import '../controllers/ao_submission_detail_controller.dart';

class AoSubmissionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoSubmissionDetailController>(
      () => AoSubmissionDetailController(),
    );
  }
}
