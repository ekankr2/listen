import 'package:get/get.dart';

class ChatController extends GetxController {
  final _messages = <String>[].obs;
  List<String> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(message);
  }
}
