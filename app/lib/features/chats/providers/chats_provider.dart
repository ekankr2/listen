import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/api_service.dart';
import '../../../models/chat.dart';

part 'chats_provider.g.dart';

@riverpod
class Chats extends _$Chats {
  @override
  Future<List<Chat>> build() async {
    return _fetchChats();
  }

  Future<List<Chat>> _fetchChats() async {
    try {
      final apiService = ref.read(apiServiceProvider);
      final chatsJson = await apiService.getChats();
      return chatsJson.map((json) => Chat.fromJson(json)).toList();
    } catch (e) {
      // Return empty list for now (mock data fallback)
      return _getMockChats();
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchChats());
  }

  // Mock data for development
  List<Chat> _getMockChats() {
    final now = DateTime.now();
    return [
      Chat(
        id: '1',
        participantId: 'user1',
        participantName: 'Alex',
        updatedAt: now.subtract(const Duration(minutes: 5)),
        unreadCount: 2,
      ),
      Chat(
        id: '2',
        participantId: 'user2',
        participantName: 'Jordan',
        updatedAt: now.subtract(const Duration(hours: 1)),
        unreadCount: 0,
      ),
      Chat(
        id: '3',
        participantId: 'user3',
        participantName: 'Sam',
        updatedAt: now.subtract(const Duration(hours: 3)),
        unreadCount: 1,
      ),
    ];
  }
}