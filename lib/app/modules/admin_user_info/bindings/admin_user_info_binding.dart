import 'package:get/get.dart';

import '../controllers/admin_user_info_controller.dart';

class AdminUserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminUserInfoController>(
      () => AdminUserInfoController(),
    );
  }
}
