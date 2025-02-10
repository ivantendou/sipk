import 'package:get/get.dart';

import '../controllers/scoring_data_controller.dart';

class ScoringDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoringDataController>(
      () => ScoringDataController(),
    );
  }
}
