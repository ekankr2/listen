import 'package:app/controllers/chat_controller.dart';
import 'package:app/controllers/record_controller.dart';
import 'package:app/app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    final recordController = Get.find<RecordController>();

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: VoiceColors.surface,
        middle: Text(
          '🎙️ Voice Chat',
          style: TextStyle(color: VoiceColors.textPrimary),
        ),
        leading: CupertinoNavigationBarBackButton(
          color: VoiceColors.primary,
          onPressed: () => Get.back(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              VoiceColors.background,
              VoiceColors.surface.withOpacity(0.8),
            ],
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
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: message.isFromUser 
                                ? [VoiceColors.primary, VoiceColors.primary.withOpacity(0.8)]
                                : [VoiceColors.cardBackground, VoiceColors.surface],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: message.isFromUser 
                                ? VoiceColors.primary.withOpacity(0.3)
                                : VoiceColors.secondary.withOpacity(0.3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: message.isPlaying 
                                  ? (message.isFromUser ? VoiceColors.primary : VoiceColors.secondary).withOpacity(0.3)
                                  : Colors.transparent,
                                blurRadius: message.isPlaying ? 15 : 0,
                                spreadRadius: message.isPlaying ? 2 : 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: message.isFromUser 
                                    ? VoiceColors.textPrimary.withOpacity(0.2)
                                    : VoiceColors.secondary.withOpacity(0.2),
                                ),
                                child: CupertinoButton(
                                  padding: EdgeInsets.all(8),
                                  minimumSize: Size(36, 36),
                                  onPressed: () => chatController.togglePlayback(index),
                                  child: Icon(
                                    message.isPlaying 
                                      ? Icons.pause_rounded 
                                      : Icons.play_arrow_rounded,
                                    color: message.isFromUser 
                                      ? VoiceColors.textPrimary 
                                      : VoiceColors.secondary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Row(
                                        children: List.generate(20, (i) => 
                                          Container(
                                            width: 2,
                                            height: message.isPlaying 
                                              ? (10 + (i % 3) * 5).toDouble()
                                              : 8.0,
                                            margin: EdgeInsets.symmetric(horizontal: 1),
                                            decoration: BoxDecoration(
                                              color: message.isFromUser 
                                                ? VoiceColors.textPrimary.withOpacity(0.7)
                                                : VoiceColors.waveform.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      message.duration,
                                      style: TextStyle(
                                        color: message.isFromUser 
                                          ? VoiceColors.textPrimary.withOpacity(0.8)
                                          : VoiceColors.textSecondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: VoiceColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                border: Border(
                  top: BorderSide(
                    color: VoiceColors.primary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() => recordController.isRecording.value
                      ? Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                VoiceColors.error.withOpacity(0.2),
                                VoiceColors.error.withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: VoiceColors.error.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: VoiceColors.error.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.mic,
                                  color: VoiceColors.error,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                '🎙️ Recording...',
                                style: TextStyle(
                                  color: VoiceColors.error,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  color: VoiceColors.success,
                                  borderRadius: BorderRadius.circular(20),
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
                                      color: VoiceColors.textPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: recordController.startRecording,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  VoiceColors.micActive,
                                  VoiceColors.primary,
                                ],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: VoiceColors.micActive.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.mic,
                              color: VoiceColors.textPrimary,
                              size: 28,
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
      ),
    );
  }
}

