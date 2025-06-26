import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  late CupertinoTabController tabController;
  var previousIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = CupertinoTabController(initialIndex: currentIndex.value);
    ever(currentIndex, (int index) {
      tabController.index = index;
    });
  }

  void changePage(int index) {
    if (index == 1) {
      previousIndex.value = currentIndex.value;
      Get.toNamed('/new-story')!.then((_) {
        currentIndex.value = previousIndex.value;
        tabController.index = previousIndex.value;
      });
      return;
    }
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/');
        break;
      case 2:
        Get.offNamed('/chats');
        break;
    }
  }
}
