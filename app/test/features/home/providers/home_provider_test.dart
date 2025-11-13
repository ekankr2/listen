import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/home/providers/home_provider.dart';
import 'package:app/core/services/api_service.dart';
import 'package:app/core/services/audio_service.dart';
import 'package:app/core/services/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart' as shared_preferences;

// Simple fake API service for testing
class FakeApiService extends ApiService {
  FakeApiService() : super(Dio(), FakeStorageService());

  @override
  Future<List<dynamic>> getRandomVoiceMessages({int limit = 10}) async {
    return [
      {
        'id': '1',
        'senderId': 'user1',
        'senderName': 'Test User',
        'senderAvatar': null,
        'audioUrl': 'https://example.com/audio.mp3',
        'localPath': null,
        'durationMs': 60000,
        'createdAt': '2024-01-01T00:00:00Z',
        'isPlaying': false,
        'isFromCurrentUser': false,
      }
    ];
  }
}

// Simple fake storage service for testing
class FakeStorageService extends StorageService {
  FakeStorageService() : super(_createFakePrefs());

  static _createFakePrefs() {
    return _FakeSharedPreferences();
  }

  @override
  Future<String?> getAccessToken() async => null;

  @override
  Future<String?> getRefreshToken() async => null;
}

// Minimal fake SharedPreferences for testing
class _FakeSharedPreferences implements shared_preferences.SharedPreferences {
  final Map<String, Object> _data = {};

  @override
  Future<bool> setBool(String key, bool value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    _data[key] = value;
    return true;
  }

  @override
  String? getString(String key) => _data[key] as String?;

  @override
  bool? getBool(String key) => _data[key] as bool?;

  @override
  Future<bool> clear() async {
    _data.clear();
    return true;
  }

  // Required interface methods (not used in test)
  @override
  Future<bool> commit() async => true;

  @override
  Set<String> getKeys() => _data.keys.toSet();

  @override
  bool containsKey(String key) => _data.containsKey(key);

  @override
  Object? get(String key) => _data[key];

  @override
  double? getDouble(String key) => _data[key] as double?;

  @override
  int? getInt(String key) => _data[key] as int?;

  @override
  List<String>? getStringList(String key) => _data[key] as List<String>?;

  @override
  Future<void> reload() async {}

  @override
  Future<bool> remove(String key) async {
    _data.remove(key);
    return true;
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    _data[key] = value;
    return true;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    _data[key] = List<String>.from(value);
    return true;
  }
}

// Simple fake audio service for testing
class FakeAudioService extends AudioService {
  @override
  Future<void> play(String url) async {}

  @override
  Future<void> playFromFile(String path) async {}

  @override
  Future<void> pause() async {}

  @override
  Future<void> stop() async {}

  @override
  Future<void> dispose() async {}
}

void main() {
  group('HomeProvider', () {
    test('shouldLoadRandomMessageOnInitialization', () async {
      // Arrange - Initialize Flutter bindings for audio services
      TestWidgetsFlutterBinding.ensureInitialized();

      final fakeApiService = FakeApiService();
      final fakeAudioService = FakeAudioService();

      final container = ProviderContainer(
        overrides: [
          apiServiceProvider.overrideWithValue(fakeApiService),
          audioServiceProvider.overrideWithValue(fakeAudioService),
        ],
      );

      addTearDown(container.dispose);

      // Act
      final notifier = container.read(homeProvider.notifier);
      await notifier.loadRandomVoiceMessage();

      // Assert
      final state = container.read(homeProvider);
      expect(state.currentMessage, isNotNull);
      expect(state.currentMessage?.id, equals('1'));
      expect(state.isLoading, isFalse);
      expect(state.error, isNull);
    });
  });
}