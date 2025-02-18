import 'package:get/get.dart';
import 'package:sipk/app/routes/app_pages.dart';

class SplashController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    bool token = true;
    if (token) {
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed(Routes.ADMIN_USER_EDIT);
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed(Routes.AO_HOME);
    }
  }
}
