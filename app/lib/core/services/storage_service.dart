import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/storage_keys.dart';

part 'storage_service.g.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  // Auth tokens
  Future<void> setAccessToken(String token) async {
    await _prefs.setString(StorageKeys.accessToken, token);
  }

  Future<String?> getAccessToken() async {
    return _prefs.getString(StorageKeys.accessToken);
  }

  Future<void> setRefreshToken(String token) async {
    await _prefs.setString(StorageKeys.refreshToken, token);
  }

  Future<String?> getRefreshToken() async {
    return _prefs.getString(StorageKeys.refreshToken);
  }

  // User data
  Future<void> setUserId(String userId) async {
    await _prefs.setString(StorageKeys.userId, userId);
  }

  Future<String?> getUserId() async {
    return _prefs.getString(StorageKeys.userId);
  }

  Future<void> setUserProfile(String profileJson) async {
    await _prefs.setString(StorageKeys.userProfile, profileJson);
  }

  Future<String?> getUserProfile() async {
    return _prefs.getString(StorageKeys.userProfile);
  }

  // Settings
  Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool(StorageKeys.isDarkMode, isDark);
  }

  bool getDarkMode() {
    return _prefs.getBool(StorageKeys.isDarkMode) ?? false;
  }

  // Clear all data (logout)
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}

@riverpod
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
StorageService storageService(StorageServiceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  if (prefs == null) {
    throw Exception('SharedPreferences not initialized');
  }
  return StorageService(prefs);
}