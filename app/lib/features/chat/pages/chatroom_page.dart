import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/style.dart';
import '../providers/chat_provider.dart';
import '../../recording/providers/recording_provider.dart';

class ChatRoomPage extends ConsumerWidget {
  final String chatId;
  final String chatName;

  const ChatRoomPage({
    super.key,
    required this.chatId,
    required this.chatName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider(chatId));
    final recordingState = ref.watch(recordingProvider);

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: VoiceColors.surface,
        middle: Text(
          '🎙️ $chatName',
          style: const TextStyle(color: VoiceColors.textPrimary),
        ),
        leading: CupertinoNavigationBarBackButton(
          color: VoiceColors.primary,
          onPressed: () => context.go('/chats'),
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
              child: chatState.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: chatState.messages.length,
                      itemBuilder: (context, index) {
                        final message = chatState.messages[index];
                        final isPlaying = chatState.currentlyPlayingId == message.id;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: message.isFromCurrentUser
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
                                    colors: message.isFromCurrentUser
                                        ? [
                                            VoiceColors.primary,
                                            VoiceColors.primary.withOpacity(0.8)
                                          ]
                                        : [
                                            VoiceColors.cardBackground,
                                            VoiceColors.surface
                                          ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: message.isFromCurrentUser
                                        ? VoiceColors.primary.withOpacity(0.3)
                                        : VoiceColors.secondary.withOpacity(0.3),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isPlaying
                                          ? (message.isFromCurrentUser
                                                  ? VoiceColors.primary
                                                  : VoiceColors.secondary)
                                              .withOpacity(0.3)
                                          : Colors.transparent,
                                      blurRadius: isPlaying ? 15 : 0,
                                      spreadRadius: isPlaying ? 2 : 0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: message.isFromCurrentUser
                                            ? VoiceColors.textPrimary.withOpacity(0.2)
                                            : VoiceColors.secondary.withOpacity(0.2),
                                      ),
                                      child: CupertinoButton(
                                        padding: const EdgeInsets.all(8),
                                        minimumSize: const Size(36, 36),
                                        onPressed: () => ref
                                            .read(chatProvider(chatId).notifier)
                                            .togglePlayback(message.id),
                                        child: Icon(
                                          isPlaying
                                              ? Icons.pause_rounded
                                              : Icons.play_arrow_rounded,
                                          color: message.isFromCurrentUser
                                              ? VoiceColors.textPrimary
                                              : VoiceColors.secondary,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            child: Row(
                                              children: List.generate(
                                                20,
                                                (i) => Container(
                                                  width: 2,
                                                  height: isPlaying
                                                      ? (10 + (i % 3) * 5).toDouble()
                                                      : 8.0,
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                                  decoration: BoxDecoration(
                                                    color: message.isFromCurrentUser
                                                        ? VoiceColors.textPrimary
                                                            .withOpacity(0.7)
                                                        : VoiceColors.waveform
                                                            .withOpacity(0.8),
                                                    borderRadius:
                                                        BorderRadius.circular(1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            _formatDuration(message.durationMs),
                                            style: TextStyle(
                                              color: message.isFromCurrentUser
                                                  ? VoiceColors.textPrimary
                                                      .withOpacity(0.8)
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
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: VoiceColors.surface,
                borderRadius: const BorderRadius.only(
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
                    child: recordingState.isRecording
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
                                const SizedBox(width: 20),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: VoiceColors.error.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.mic,
                                    color: VoiceColors.error,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  '🎙️ Recording...',
                                  style: TextStyle(
                                    color: VoiceColors.error,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    color: VoiceColors.success,
                                    borderRadius: BorderRadius.circular(20),
                                    onPressed: () async {
                                      final path = await ref
                                          .read(recordingProvider.notifier)
                                          .stopRecording();
                                      if (path != null) {
                                        await ref
                                            .read(chatProvider(chatId).notifier)
                                            .sendVoiceMessage(path, 3000); // TODO: Get actual duration
                                      }
                                    },
                                    child: const Text(
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
                            onPressed: () =>
                                ref.read(recordingProvider.notifier).startRecording(),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
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
                              child: const Icon(
                                Icons.mic,
                                color: VoiceColors.textPrimary,
                                size: 28,
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

  String _formatDuration(int durationMs) {
    final seconds = (durationMs / 1000).round();
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}