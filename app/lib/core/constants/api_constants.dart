/// API endpoint constants
/// Update these when your backend is ready
class ApiConstants {
  // Base URL - replace with your actual backend URL
  static const String baseUrl = 'http://localhost:3000/api';

  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';

  static const String users = '/users';
  static const String profile = '/users/profile';

  static const String chats = '/chats';
  static const String messages = '/messages';

  static const String stories = '/stories';

  static const String voiceMessages = '/voice-messages';
  static const String uploadAudio = '/voice-messages/upload';
}