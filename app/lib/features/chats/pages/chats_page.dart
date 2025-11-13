import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/style.dart';
import '../providers/chats_provider.dart';

class ChatsPage extends ConsumerWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsAsync = ref.watch(chatsProvider);

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Voice Chats'),
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
        child: chatsAsync.when(
          data: (chats) {
            if (chats.isEmpty) {
              return const Center(
                child: Text(
                  'No chats yet',
                  style: TextStyle(
                    color: VoiceColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final chat = chats[index];
                final color = _getColorForIndex(index);

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: VoiceColors.cardBackground.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: color.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(16),
                    onPressed: () {
                      context.go('/chat/${chat.id}?name=${chat.participantName}');
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                color,
                                color.withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: VoiceColors.textPrimary,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.participantName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: VoiceColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                chat.lastMessage?.audioUrl ?? 'Voice message',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: VoiceColors.textSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              _formatTime(chat.updatedAt),
                              style: TextStyle(
                                fontSize: 12,
                                color: VoiceColors.textSecondary.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (chat.unreadCount > 0)
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  chat.unreadCount.toString(),
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            else
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: color,
                                  size: 16,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text(
              'Error loading chats',
              style: const TextStyle(
                color: VoiceColors.error,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorForIndex(int index) {
    final colors = [
      VoiceColors.primary,
      VoiceColors.secondary,
      VoiceColors.accent,
      VoiceColors.success,
      VoiceColors.warning,
      VoiceColors.micActive,
      VoiceColors.waveform,
    ];
    return colors[index % colors.length];
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}