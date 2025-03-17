import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sipk/app/services/user_service.dart';
import 'package:sipk/models/user_model.dart';

class AdminUserDetailController extends GetxController {
  final UserService userService = UserService();
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  var userId = ''.obs; 

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if(args != null) {
      userId.value = args['userId'] ?? '';
    }
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      isLoading(true);
      final res = await userService.fetchUser(userId.value);
      user.value = res;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }
}
