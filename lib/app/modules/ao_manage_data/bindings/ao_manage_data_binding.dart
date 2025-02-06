import 'package:get/get.dart';

import '../controllers/ao_manage_data_controller.dart';

class AoManageDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoManageDataController>(
      () => AoManageDataController(),
    );
  }
}
