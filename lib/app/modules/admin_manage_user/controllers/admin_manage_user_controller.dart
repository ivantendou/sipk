import 'package:get/get.dart';

class AdminManageUserController extends GetxController {
  var isSearching = false.obs;

  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }
}
