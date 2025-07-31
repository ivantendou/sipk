import 'package:get/get.dart';

import '../controllers/ao_select_scoring_controller.dart';

class AoSelectScoringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoSelectScoringController>(
      () => AoSelectScoringController(),
    );
  }
}
