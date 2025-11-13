import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/style.dart';
import '../../../shared/widgets/circle_button.dart';
import '../providers/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load initial message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).loadRandomVoiceMessage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Discover'),
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
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: VoiceColors.cardBackground.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: VoiceColors.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: state.currentMessage != null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.currentMessage!.senderName ?? 'Unknown',
                            style: const TextStyle(
                              fontSize: 18,
                              color: VoiceColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _formatDuration(state.currentMessage!.durationMs),
                            style: const TextStyle(
                              fontSize: 14,
                              color: VoiceColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTimestamp(state.currentMessage!.createdAt),
                            style: const TextStyle(
                              fontSize: 12,
                              color: VoiceColors.textSecondary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        state.isLoading
                            ? '🔍 Looking for new voices...'
                            : '🔍 Tap to discover',
                        style: const TextStyle(
                          fontSize: 18,
                          color: VoiceColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: state.isPlaying
                      ? [
                          BoxShadow(
                            color: VoiceColors.primary.withOpacity(0.4),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ]
                      : null,
                ),
                child: CircleButton(
                  padding: 35,
                  onPressed: state.currentMessage != null
                      ? () => ref.read(homeProvider.notifier).playCurrentMessage()
                      : () => ref.read(homeProvider.notifier).loadRandomVoiceMessage(),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: state.currentMessage != null
                            ? [VoiceColors.primary, VoiceColors.secondary]
                            : [
                                VoiceColors.textSecondary.withOpacity(0.3),
                                VoiceColors.textSecondary.withOpacity(0.1)
                              ],
                      ),
                    ),
                    child: Icon(
                      state.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      color: VoiceColors.textPrimary,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.skip_next_rounded,
                    label: 'Skip',
                    color: state.currentMessage != null
                        ? VoiceColors.warning
                        : VoiceColors.textSecondary,
                    onPressed: state.currentMessage != null
                        ? () => ref.read(homeProvider.notifier).skipCurrentMessage()
                        : () {},
                  ),
                  _buildActionButton(
                    icon: Icons.bookmark_add_rounded,
                    label: 'Save',
                    color: VoiceColors.accent,
                    onPressed: () {},
                  ),
                  _buildActionButton(
                    icon: CupertinoIcons.heart_fill,
                    label: 'Reply',
                    color: state.currentMessage != null
                        ? VoiceColors.success
                        : VoiceColors.textSecondary,
                    onPressed: state.currentMessage != null ? () {} : () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: VoiceColors.cardBackground,
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: CircleButton(
            padding: 16,
            onPressed: onPressed,
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: VoiceColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatDuration(int durationMs) {
    final seconds = (durationMs / 1000).round();
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String _formatTimestamp(DateTime timestamp) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[timestamp.month - 1]} ${timestamp.day}';
  }
}