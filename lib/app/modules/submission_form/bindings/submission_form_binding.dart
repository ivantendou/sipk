import 'package:get/get.dart';

import '../controllers/submission_form_controller.dart';

class SubmissionFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmissionFormController>(
      () => SubmissionFormController(),
    );
  }
}
