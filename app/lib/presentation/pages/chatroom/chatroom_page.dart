import 'package:app/controllers/chat_controller.dart';
import 'package:app/controllers/record_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    final recordController = Get.find<RecordController>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Voice Chat'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Get.back(),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chatController.voiceMessages.length,
              itemBuilder: (context, index) {
                final message = chatController.voiceMessages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: message.isFromUser 
                      ? MainAxisAlignment.end 
                      : MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: message.isFromUser 
                            ? CupertinoColors.activeBlue
                            : CupertinoColors.systemGrey5,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(30, 30),
                              onPressed: () => chatController.togglePlayback(index),
                              child: Icon(
                                message.isPlaying 
                                  ? CupertinoIcons.pause_fill 
                                  : CupertinoIcons.play_fill,
                                color: message.isFromUser 
                                  ? CupertinoColors.white 
                                  : CupertinoColors.activeBlue,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    message.duration,
                                    style: TextStyle(
                                      color: message.isFromUser 
                                        ? CupertinoColors.white 
                                        : CupertinoColors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground,
              border: Border(
                top: BorderSide(
                  color: CupertinoColors.systemGrey4,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => recordController.isRecording.value
                    ? Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey6,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 16),
                            Icon(
                              CupertinoIcons.mic_fill,
                              color: CupertinoColors.systemRed,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Recording...',
                              style: TextStyle(
                                color: CupertinoColors.systemRed,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await recordController.stopRecording();
                                if (recordController.recordPath.value.isNotEmpty) {
                                  chatController.sendVoiceMessage(
                                    recordController.recordPath.value,
                                    true,
                                  );
                                }
                              },
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: CupertinoColors.activeBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      )
                    : CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: recordController.startRecording,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            CupertinoIcons.mic_fill,
                            color: CupertinoColors.white,
                            size: 24,
                          ),
                        ),
                      ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

