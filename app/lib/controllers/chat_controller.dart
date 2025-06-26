import 'package:get/get.dart';

class VoiceMessage {
  final String filePath;
  final bool isFromUser;
  final String duration;
  final bool isPlaying;

  VoiceMessage({
    required this.filePath,
    required this.isFromUser,
    this.duration = '0:03',
    this.isPlaying = false,
  });

  VoiceMessage copyWith({
    String? filePath,
    bool? isFromUser,
    String? duration,
    bool? isPlaying,
  }) {
    return VoiceMessage(
      filePath: filePath ?? this.filePath,
      isFromUser: isFromUser ?? this.isFromUser,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class ChatController extends GetxController {
  final _voiceMessages = <VoiceMessage>[].obs;
  List<VoiceMessage> get voiceMessages => _voiceMessages;

  @override
  void onInit() {
    super.onInit();
    _voiceMessages.add(VoiceMessage(
      filePath: 'initial_message.m4a',
      isFromUser: false,
      duration: '0:05',
    ));
  }

  void sendVoiceMessage(String filePath, bool isFromUser) {
    _voiceMessages.add(VoiceMessage(
      filePath: filePath,
      isFromUser: isFromUser,
      duration: '0:03',
    ));
  }

  void togglePlayback(int index) {
    if (index >= 0 && index < _voiceMessages.length) {
      for (int i = 0; i < _voiceMessages.length; i++) {
        _voiceMessages[i] = _voiceMessages[i].copyWith(isPlaying: false);
      }
      
      _voiceMessages[index] = _voiceMessages[index].copyWith(
        isPlaying: !_voiceMessages[index].isPlaying
      );
      _voiceMessages.refresh();
    }
  }
}
