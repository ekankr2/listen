import 'package:app/controllers/chat_controller.dart';
import 'package:app/controllers/navigation_controller.dart';
import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/settings_controller.dart';
import 'package:app/repositories/user_repository.dart';
import 'package:app/services/api_service.dart';
import 'package:app/services/storage_service.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
    Get.put(HomeController());

    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => SettingsController());

    // Services
    Get.put(ApiService(), permanent: true);
    Get.put(StorageService(), permanent: true);

    // Repositories
    Get.put(UserRepository(
      apiService: Get.find(),
      storageService: Get.find(),
    ));
  }
}
