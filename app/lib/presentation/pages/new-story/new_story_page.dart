import 'package:app/controllers/navigation_controller.dart';
import 'package:app/presentation/widgets/buttons/circle_button.dart';
import 'package:app/presentation/widgets/pill.dart';
import 'package:app/app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewStoryPage extends StatelessWidget {
  const NewStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return CupertinoPageScaffold(
      backgroundColor: VoiceColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: VoiceColors.surface,
        middle: Text(
          '🎙️ Create Voice Story',
          style: TextStyle(color: VoiceColors.textPrimary),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: VoiceColors.accent.withOpacity(0.4),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleButton(
                      padding: 40,
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [VoiceColors.accent, VoiceColors.warning],
                          ),
                        ),
                        child: Icon(
                          Icons.mic_rounded,
                          color: VoiceColors.textPrimary,
                          size: 120,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: VoiceColors.cardBackground.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: VoiceColors.accent.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: VoiceColors.accent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'example',
                            style: TextStyle(
                              color: VoiceColors.accent,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            "You won't believe what happened to me today...",
                            style: TextStyle(
                              fontSize: 16,
                              color: VoiceColors.textSecondary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(28),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [VoiceColors.primary, VoiceColors.secondary],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: VoiceColors.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  onPressed: () {},
                  child: Text(
                    '🚀 Share Your Story',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: VoiceColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
