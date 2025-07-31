import 'package:get/get.dart';

import '../controllers/admin_user_add_controller.dart';

class AdminUserAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminUserAddController>(
      () => AdminUserAddController(),
    );
  }
}
