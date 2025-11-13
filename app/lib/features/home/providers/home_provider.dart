import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/audio_service.dart';
import '../../../models/voice_message.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  HomeState build() {
    return const HomeState();
  }

  Future<void> loadRandomVoiceMessage() async {
    state = state.copyWith(isLoading: true);

    try {
      final apiService = ref.read(apiServiceProvider);
      final messages = await apiService.getRandomVoiceMessages(limit: 1);

      if (messages.isNotEmpty) {
        final message = VoiceMessage.fromJson(messages.first);
        state = state.copyWith(
          currentMessage: message,
          isLoading: false,
          error: null,
        );
      } else {
        state = state.copyWith(
          currentMessage: null,
          isLoading: false,
          error: 'No messages available',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> playCurrentMessage() async {
    final message = state.currentMessage;
    if (message == null) return;

    final audioService = ref.read(audioServiceProvider);

    if (state.isPlaying) {
      await audioService.pause();
      state = state.copyWith(isPlaying: false);
    } else {
      if (message.localPath != null) {
        await audioService.playFromFile(message.localPath!);
      } else {
        await audioService.play(message.audioUrl);
      }
      state = state.copyWith(isPlaying: true);
    }
  }

  Future<void> skipCurrentMessage() async {
    final audioService = ref.read(audioServiceProvider);
    await audioService.stop();
    state = state.copyWith(isPlaying: false);
    await loadRandomVoiceMessage();
  }
}

class HomeState {
  final VoiceMessage? currentMessage;
  final bool isPlaying;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.currentMessage,
    this.isPlaying = false,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    VoiceMessage? currentMessage,
    bool? isPlaying,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      currentMessage: currentMessage ?? this.currentMessage,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}