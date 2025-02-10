import 'package:get/get.dart';

import '../controllers/admin_manage_data_controller.dart';

class AdminManageDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminManageDataController>(
      () => AdminManageDataController(),
    );
  }
}
