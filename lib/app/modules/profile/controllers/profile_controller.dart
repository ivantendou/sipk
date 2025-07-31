import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/auth_service.dart';
import 'package:sipk/app/services/user_service.dart';
import 'package:sipk/models/user_model.dart';

class ProfileController extends GetxController {
  final UserService userService = UserService();
  final AuthService authService = AuthService();
  var user = UserModel().obs;
  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    try {
      isLoading(true);
      final res = await userService.fetchUser(userId!);
      user.value = res;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }

  void logout() async {
    await authService.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.deleteAll();
    Get.offAllNamed(Routes.LOGIN);
  }
}
