import 'package:get/get.dart';

class HomeController extends GetxController {
  final _title = 'Home'.obs;
  String get title => _title.value;

  @override
  void onInit() {
    super.onInit();

  }
}

