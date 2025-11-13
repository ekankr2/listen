import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_service.g.dart';

class AudioService {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  bool _isRecording = false;

  // Recording methods
  Future<bool> hasRecordPermission() async {
    return await _recorder.hasPermission();
  }

  Future<String?> startRecording() async {
    if (_isRecording) return null;

    final hasPermission = await hasRecordPermission();
    if (!hasPermission) return null;

    try {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: path,
      );

      _isRecording = true;
      return path;
    } catch (e) {
      return null;
    }
  }

  Future<String?> stopRecording() async {
    if (!_isRecording) return null;

    try {
      final path = await _recorder.stop();
      _isRecording = false;
      return path;
    } catch (e) {
      return null;
    }
  }

  bool get isRecording => _isRecording;

  Future<void> cancelRecording() async {
    await _recorder.stop();
    _isRecording = false;
  }

  // Playback methods
  Future<void> play(String url) async {
    try {
      await _player.setUrl(url);
      await _player.play();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> playFromFile(String filePath) async {
    try {
      await _player.setFilePath(filePath);
      await _player.play();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;

  bool get isPlaying => _player.playing;
  Duration? get duration => _player.duration;
  Duration get position => _player.position;

  Future<void> dispose() async {
    await _recorder.dispose();
    await _player.dispose();
  }
}

@riverpod
AudioService audioService(AudioServiceRef ref) {
  final service = AudioService();
  ref.onDispose(() => service.dispose());
  return service;
}