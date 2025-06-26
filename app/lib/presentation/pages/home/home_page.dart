import 'package:app/controllers/home_controller.dart';
import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:app/presentation/widgets/buttons/circle_button.dart';
import 'package:app/app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return BaseScaffold(
      title: title,
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
        child: Center(
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: VoiceColors.cardBackground.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: VoiceColors.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Obx(() => Text(
                  controller.hasCurrentMessage 
                    ? '🎵 New voice message from someone nearby...'
                    : '🔍 Looking for new voices...',
                  style: TextStyle(
                    fontSize: 18,
                    color: VoiceColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
              Obx(() => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: controller.isPlaying ? [
                    BoxShadow(
                      color: VoiceColors.primary.withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ] : null,
                ),
                child: CircleButton(
                  padding: 35,
                  onPressed: controller.hasCurrentMessage 
                    ? () => controller.playCurrentMessage() 
                    : () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: controller.hasCurrentMessage 
                          ? [VoiceColors.primary, VoiceColors.secondary]
                          : [VoiceColors.textSecondary.withOpacity(0.3), VoiceColors.textSecondary.withOpacity(0.1)],
                      ),
                    ),
                    child: Icon(
                      controller.isPlaying 
                        ? Icons.pause_rounded 
                        : Icons.play_arrow_rounded,
                      color: VoiceColors.textPrimary,
                      size: 100,
                    ),
                  ),
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => _buildActionButton(
                    icon: Icons.skip_next_rounded,
                    label: 'Skip',
                    color: controller.hasCurrentMessage ? VoiceColors.warning : VoiceColors.textSecondary,
                    onPressed: controller.hasCurrentMessage 
                      ? () => controller.skipCurrentMessage() 
                      : () {},
                  )),
                  _buildActionButton(
                    icon: Icons.bookmark_add_rounded,
                    label: 'Save',
                    color: VoiceColors.accent,
                    onPressed: () {},
                  ),
                  Obx(() => _buildActionButton(
                    icon: CupertinoIcons.heart_fill,
                    label: 'Reply',
                    color: controller.hasCurrentMessage ? VoiceColors.success : VoiceColors.textSecondary,
                    onPressed: controller.hasCurrentMessage 
                      ? () => controller.replyToCurrentMessage() 
                      : () {},
                  )),
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
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: VoiceColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
