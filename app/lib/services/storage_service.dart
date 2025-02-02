import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final _box = GetStorage();

  Future<void> saveUser(Map<String, dynamic> user) async {
    await _box.write('user', user);
  }

  Future<Map<String, dynamic>?> getUser() async {
    return await _box.read('user');
  }

  Future<void> clearUser() async {
    await _box.remove('user');
  }
}

