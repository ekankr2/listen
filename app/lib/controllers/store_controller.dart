import 'package:get/get.dart';

class StoreController extends GetxController {
  var name = 'paul kim'.obs;

  void changeName() {
    name.value = 'jane doe';
  }
}
