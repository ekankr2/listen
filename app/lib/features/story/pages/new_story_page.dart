import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/style.dart';
import '../../../shared/widgets/circle_button.dart';
import '../../recording/providers/recording_provider.dart';

class NewStoryPage extends ConsumerWidget {
  const NewStoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordingState = ref.watch(recordingProvider);

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('New Story'),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '📖 Share Your Voice',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: VoiceColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                recordingState.isRecording
                    ? 'Recording your story...'
                    : 'Record a voice story that will be visible\nfor 24 hours',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: VoiceColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: recordingState.isRecording
                      ? [
                          BoxShadow(
                            color: VoiceColors.error.withOpacity(0.5),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ]
                      : null,
                ),
                child: CircleButton(
                  padding: 40,
                  onPressed: () async {
                    if (recordingState.isRecording) {
                      final path =
                          await ref.read(recordingProvider.notifier).stopRecording();
                      if (path != null) {
                        // TODO: Upload story to backend
                        if (context.mounted) {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Story Recorded'),
                              content:
                                  const Text('Your story will be shared for 24 hours'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    } else {
                      await ref.read(recordingProvider.notifier).startRecording();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: recordingState.isRecording
                            ? [VoiceColors.error, VoiceColors.warning]
                            : [VoiceColors.primary, VoiceColors.secondary],
                      ),
                    ),
                    child: Icon(
                      recordingState.isRecording
                          ? Icons.stop_rounded
                          : Icons.mic_rounded,
                      color: VoiceColors.textPrimary,
                      size: 80,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              if (recordingState.isRecording)
                CupertinoButton(
                  onPressed: () =>
                      ref.read(recordingProvider.notifier).cancelRecording(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: VoiceColors.error,
                      fontSize: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}