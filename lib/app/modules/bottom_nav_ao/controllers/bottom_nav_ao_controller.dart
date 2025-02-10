import 'package:get/get.dart';

class BottomNavAoController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
