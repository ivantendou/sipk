import 'package:get/get.dart';

import '../controllers/admin_user_detail_controller.dart';

class AdminUserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminUserDetailController>(
      () => AdminUserDetailController(),
    );
  }
}
