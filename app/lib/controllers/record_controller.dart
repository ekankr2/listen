import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class RecordController extends GetxController {
  final recorder = AudioRecorder();
  var isRecording = false.obs;
  var recordPath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (!await recorder.hasPermission()) {
      // Handle permission denied
      print('Microphone permission denied');
    }
  }

  Future<void> startRecording() async {
    try {
      if (await recorder.hasPermission()) {
        final appDir = await getApplicationDocumentsDirectory();
        final filePath = '${appDir.path}/myRecording.m4a';

        await recorder.start(
          const RecordConfig(
            encoder: AudioEncoder.aacLc, // Common format
            bitRate: 128000,
            sampleRate: 44100,
          ),
          path: filePath,
        );
        isRecording.value = true;
      }
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      final path = await recorder.stop();
      isRecording.value = false;
      if (path != null) {
        recordPath.value = path;
      }
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  @override
  void onClose() {
    recorder.dispose();
    super.onClose();
  }
}
