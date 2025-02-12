import 'package:get/get.dart';

import '../controllers/scoring_form_controller.dart';

class ScoringFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoringFormController>(
      () => ScoringFormController(),
    );
  }
}
