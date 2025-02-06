import 'package:get/get.dart';

import '../controllers/manager_scoring_detail_controller.dart';

class ManagerScoringDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerScoringDetailController>(
      () => ManagerScoringDetailController(),
    );
  }
}
