import 'package:app/models/user.dart';
import 'package:app/services/api_service.dart';
import 'package:app/services/storage_service.dart';

class UserRepository {
  final ApiService _apiService;
  final StorageService _storageService;

  UserRepository({
    required ApiService apiService,
    required StorageService storageService,
  })  : _apiService = apiService,
        _storageService = storageService;

  Future<User?> getUser(String id) async {
    try {
      final response = await _apiService.get('/users/$id');
      if (response.statusCode == 200) {
        return User.fromJson(response.body);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> createUser(User user) async {
    try {
      final response = await _apiService.post('/users', user.toJson());
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
