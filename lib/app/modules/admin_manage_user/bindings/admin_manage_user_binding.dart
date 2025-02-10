import 'package:get/get.dart';

import '../controllers/admin_manage_user_controller.dart';

class AdminManageUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminManageUserController>(
      () => AdminManageUserController(),
    );
  }
}
