import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed('/');
        break;
      case 1:
        Get.offAllNamed('/new-chat');
        break;
      case 2:
        Get.offAllNamed('/chats');
        break;
    }
  }
}