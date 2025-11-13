import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/audio_service.dart';

part 'recording_provider.g.dart';

@riverpod
class Recording extends _$Recording {
  @override
  RecordingState build() {
    return const RecordingState();
  }

  Future<void> startRecording() async {
    final audioService = ref.read(audioServiceProvider);

    final hasPermission = await audioService.hasRecordPermission();
    if (!hasPermission) {
      state = state.copyWith(error: 'Microphone permission denied');
      return;
    }

    final path = await audioService.startRecording();
    if (path != null) {
      state = state.copyWith(
        isRecording: true,
        recordingPath: path,
        error: null,
      );
    } else {
      state = state.copyWith(error: 'Failed to start recording');
    }
  }

  Future<String?> stopRecording() async {
    final audioService = ref.read(audioServiceProvider);
    final path = await audioService.stopRecording();

    state = state.copyWith(
      isRecording: false,
      recordingPath: path,
    );

    return path;
  }

  Future<void> cancelRecording() async {
    final audioService = ref.read(audioServiceProvider);
    await audioService.cancelRecording();

    state = const RecordingState();
  }
}

class RecordingState {
  final bool isRecording;
  final String? recordingPath;
  final String? error;

  const RecordingState({
    this.isRecording = false,
    this.recordingPath,
    this.error,
  });

  RecordingState copyWith({
    bool? isRecording,
    String? recordingPath,
    String? error,
  }) {
    return RecordingState(
      isRecording: isRecording ?? this.isRecording,
      recordingPath: recordingPath ?? this.recordingPath,
      error: error,
    );
  }
}