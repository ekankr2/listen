import 'package:get/get.dart';

class HomeController extends GetxController {
  final _title = 'Home'.obs;
  String get title => _title.value;

  final _currentVoiceMessage = ''.obs;
  final _isPlaying = false.obs;
  final _hasCurrentMessage = false.obs;

  String get currentVoiceMessage => _currentVoiceMessage.value;
  bool get isPlaying => _isPlaying.value;
  bool get hasCurrentMessage => _hasCurrentMessage.value;

  @override
  void onInit() {
    super.onInit();
    loadRandomVoiceMessage();
  }

  void loadRandomVoiceMessage() {
    _currentVoiceMessage.value = 'mock_voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _hasCurrentMessage.value = true;
    _isPlaying.value = false;
  }

  void playCurrentMessage() {
    if (!_hasCurrentMessage.value) return;
    _isPlaying.value = !_isPlaying.value;
  }

  void skipCurrentMessage() {
    _isPlaying.value = false;
    loadRandomVoiceMessage();
  }

  void replyToCurrentMessage() {
    if (!_hasCurrentMessage.value) return;
    final chatId = DateTime.now().millisecondsSinceEpoch.toString();
    Get.toNamed('/chats/$chatId');
  }
}

