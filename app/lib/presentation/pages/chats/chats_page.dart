import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:app/app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> chats = [
      {'name': 'Alex', 'lastMessage': 'Hey, how was your day?', 'time': '2m ago', 'color': VoiceColors.primary},
      {'name': 'Sam', 'lastMessage': 'Thanks for the voice note!', 'time': '15m ago', 'color': VoiceColors.secondary},
      {'name': 'Jordan', 'lastMessage': 'Let\'s catch up soon', 'time': '1h ago', 'color': VoiceColors.accent},
      {'name': 'Casey', 'lastMessage': 'That was hilarious 😂', 'time': '3h ago', 'color': VoiceColors.success},
      {'name': 'Riley', 'lastMessage': 'Voice message', 'time': '1d ago', 'color': VoiceColors.warning},
      {'name': 'Avery', 'lastMessage': 'Good morning!', 'time': '2d ago', 'color': VoiceColors.micActive},
      {'name': 'Quinn', 'lastMessage': 'See you later', 'time': '3d ago', 'color': VoiceColors.waveform},
    ];

    return BaseScaffold(
      title: 'Voice Chats',
      body: Container(
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
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final chat = chats[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: VoiceColors.cardBackground.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: chat['color'].withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: CupertinoButton(
                padding: EdgeInsets.all(16),
                onPressed: () {
                  Get.toNamed('/chats/${chat['name']}');
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
                            chat['color'],
                            chat['color'].withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: VoiceColors.textPrimary,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: VoiceColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            chat['lastMessage'],
                            style: TextStyle(
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
                          chat['time'],
                          style: TextStyle(
                            fontSize: 12,
                            color: VoiceColors.textSecondary.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: chat['color'].withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: chat['color'],
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
        ),
      ),
    );
  }
}
