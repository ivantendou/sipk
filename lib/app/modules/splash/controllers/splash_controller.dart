import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final role = prefs.getString('role');
    final loginTimestamp = prefs.getInt('loginTimestamp');

    if (userId != null && role != null && loginTimestamp != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final isSessionValid = now - loginTimestamp < 3600000;

      if (isSessionValid) {
        if (role == 'Admin') {
          Get.offAllNamed(Routes.BOTTOM_NAV_ADMIN);
        } else if (role == 'Manajer') {
          Get.offAllNamed(Routes.BOTTOM_NAV_MANAGER);
        } else {
          Get.offAllNamed(Routes.BOTTOM_NAV_AO);
        }
        return;
      }
    }

    Get.offAllNamed(Routes.LOGIN);
  }
}
