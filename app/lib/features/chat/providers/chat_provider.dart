import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/audio_service.dart';
import '../../../models/voice_message.dart';

part 'chat_provider.g.dart';

@riverpod
class Chat extends _$Chat {
  String? _chatId;

  @override
  ChatState build(String chatId) {
    _chatId = chatId;
    _loadMessages();
    return const ChatState();
  }

  Future<void> _loadMessages() async {
    state = state.copyWith(isLoading: true);

    try {
      final apiService = ref.read(apiServiceProvider);
      final messagesJson = await apiService.getMessages(_chatId!);
      final messages = messagesJson
          .map((json) => VoiceMessage.fromJson(json))
          .toList();

      state = state.copyWith(
        messages: messages,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        messages: [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> sendVoiceMessage(String audioPath, int durationMs) async {
    try {
      // Upload audio file
      final apiService = ref.read(apiServiceProvider);
      final uploadResult = await apiService.uploadAudio(audioPath);
      final audioUrl = uploadResult['url'];

      // Send message
      final messageJson = await apiService.sendMessage(
        _chatId!,
        audioUrl,
        durationMs,
      );

      final message = VoiceMessage.fromJson(messageJson);

      // Add to local state
      state = state.copyWith(
        messages: [...state.messages, message],
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> togglePlayback(String messageId) async {
    final audioService = ref.read(audioServiceProvider);
    final message = state.messages.firstWhere((m) => m.id == messageId);

    if (state.currentlyPlayingId == messageId) {
      await audioService.pause();
      state = state.copyWith(currentlyPlayingId: null);
    } else {
      if (message.localPath != null) {
        await audioService.playFromFile(message.localPath!);
      } else {
        await audioService.play(message.audioUrl);
      }
      state = state.copyWith(currentlyPlayingId: messageId);
    }
  }

  Future<void> refresh() async {
    await _loadMessages();
  }
}

class ChatState {
  final List<VoiceMessage> messages;
  final String? currentlyPlayingId;
  final bool isLoading;
  final String? error;

  const ChatState({
    this.messages = const [],
    this.currentlyPlayingId,
    this.isLoading = false,
    this.error,
  });

  ChatState copyWith({
    List<VoiceMessage>? messages,
    String? currentlyPlayingId,
    bool? isLoading,
    String? error,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      currentlyPlayingId: currentlyPlayingId ?? this.currentlyPlayingId,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}