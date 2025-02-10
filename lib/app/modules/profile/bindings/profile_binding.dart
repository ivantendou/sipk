import 'package:get/get.dart';
import 'package:sipk/app/modules/profile/controllers/ao_profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
