import 'package:get/get.dart';

import '../controllers/ao_home_controller.dart';

class AoHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AoHomeController>(
      () => AoHomeController(),
    );
  }
}
