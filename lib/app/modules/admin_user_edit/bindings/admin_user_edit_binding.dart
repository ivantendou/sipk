import 'package:get/get.dart';

import '../controllers/admin_user_edit_controller.dart';

class AdminUserEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminUserEditController>(
      () => AdminUserEditController(),
    );
  }
}
