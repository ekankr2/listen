import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/api_constants.dart';
import 'storage_service.dart';

part 'api_service.g.dart';

class ApiService {
  final Dio _dio;
  final StorageService _storage;

  ApiService(this._dio, this._storage) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add auth token to all requests
          final token = await _storage.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          // Handle 401 (unauthorized) - refresh token
          if (error.response?.statusCode == 401) {
            // TODO: Implement token refresh logic
            // final refreshed = await _refreshToken();
            // if (refreshed) {
            //   return handler.resolve(await _retry(error.requestOptions));
            // }
          }
          return handler.next(error);
        },
      ),
    );
  }

  // Auth endpoints
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.register, data: data);
    return response.data;
  }

  // User endpoints
  Future<Map<String, dynamic>> getProfile() async {
    final response = await _dio.get(ApiConstants.profile);
    return response.data;
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> data) async {
    final response = await _dio.put(ApiConstants.profile, data: data);
    return response.data;
  }

  // Chat endpoints
  Future<List<dynamic>> getChats() async {
    final response = await _dio.get(ApiConstants.chats);
    return response.data['chats'] ?? [];
  }

  Future<Map<String, dynamic>> getChat(String chatId) async {
    final response = await _dio.get('${ApiConstants.chats}/$chatId');
    return response.data;
  }

  // Message endpoints
  Future<List<dynamic>> getMessages(String chatId) async {
    final response = await _dio.get(
      ApiConstants.messages,
      queryParameters: {'chatId': chatId},
    );
    return response.data['messages'] ?? [];
  }

  Future<Map<String, dynamic>> sendMessage(
    String chatId,
    String audioUrl,
    int durationMs,
  ) async {
    final response = await _dio.post(
      ApiConstants.messages,
      data: {
        'chatId': chatId,
        'audioUrl': audioUrl,
        'durationMs': durationMs,
      },
    );
    return response.data;
  }

  // Story endpoints
  Future<List<dynamic>> getStories() async {
    final response = await _dio.get(ApiConstants.stories);
    return response.data['stories'] ?? [];
  }

  Future<Map<String, dynamic>> createStory(
    String audioUrl,
    int durationMs,
  ) async {
    final response = await _dio.post(
      ApiConstants.stories,
      data: {
        'audioUrl': audioUrl,
        'durationMs': durationMs,
      },
    );
    return response.data;
  }

  // Voice message endpoints
  Future<List<dynamic>> getRandomVoiceMessages({int limit = 10}) async {
    final response = await _dio.get(
      ApiConstants.voiceMessages,
      queryParameters: {'limit': limit, 'random': true},
    );
    return response.data['messages'] ?? [];
  }

  // Upload audio file
  Future<Map<String, dynamic>> uploadAudio(String filePath) async {
    final formData = FormData.fromMap({
      'audio': await MultipartFile.fromFile(filePath),
    });

    final response = await _dio.post(
      ApiConstants.uploadAudio,
      data: formData,
    );
    return response.data;
  }
}

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  return dio;
}

@riverpod
ApiService apiService(ApiServiceRef ref) {
  final dio = ref.watch(dioProvider);
  final storage = ref.watch(storageServiceProvider);
  return ApiService(dio, storage);
}