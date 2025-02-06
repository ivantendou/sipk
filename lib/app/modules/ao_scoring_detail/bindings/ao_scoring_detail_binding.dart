import 'package:get/get.dart';

import '../controllers/ao_scoring_detail_controller.dart';

class AoScoringDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoScoringDetailController>(
      () => AoScoringDetailController(),
    );
  }
}
