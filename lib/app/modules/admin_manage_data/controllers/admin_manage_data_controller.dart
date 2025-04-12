import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminManageDataController extends GetxController {
  final username = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? "";
  }

}
