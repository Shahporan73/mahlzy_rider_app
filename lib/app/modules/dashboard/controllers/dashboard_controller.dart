import 'package:get/get.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0; // Default selected tab

  void changePage(int index) {
    selectedIndex = index;
    update(); // Notify UI to refresh
  }
}
