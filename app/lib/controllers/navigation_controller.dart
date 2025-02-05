import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/');
        break;
      case 1:
        Get.toNamed('/new-story');
        break;
      case 2:
        Get.offNamed('/chats');
        break;
    }
  }
}