import 'package:app/controllers/navigation_controller.dart';
import 'package:app/app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return Obx(() {
      return CupertinoTabScaffold(
        controller: navigationController.tabController,
        tabBar: CupertinoTabBar(
          backgroundColor: VoiceColors.surface,
          activeColor: VoiceColors.primary,
          inactiveColor: VoiceColors.textSecondary.withOpacity(0.6),
          border: Border(
            top: BorderSide(
              color: VoiceColors.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: navigationController.currentIndex.value == 0 
                    ? VoiceColors.primary.withOpacity(0.2)
                    : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(CupertinoIcons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [VoiceColors.accent, VoiceColors.warning],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(CupertinoIcons.add, color: VoiceColors.textPrimary),
              ),
              label: 'New Story',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: navigationController.currentIndex.value == 2 
                    ? VoiceColors.secondary.withOpacity(0.2)
                    : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(CupertinoIcons.chat_bubble_2),
              ),
              label: 'Chats',
            ),
          ],
          onTap: navigationController.changePage,
          currentIndex: navigationController.currentIndex.value,
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                backgroundColor: VoiceColors.background,
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: VoiceColors.surface,
                  border: Border(
                    bottom: BorderSide(
                      color: VoiceColors.primary.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  leading: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 22, 
                          fontWeight: FontWeight.bold,
                          color: VoiceColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: VoiceColors.cardBackground,
                      shape: BoxShape.circle,
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        CupertinoIcons.settings, 
                        size: 20,
                        color: VoiceColors.textSecondary,
                      ),
                      onPressed: () {
                        Get.toNamed("/settings");
                      },
                    ),
                  ),
                ),
                child: SafeArea(
                  child: body,
                ),
              );
            },
          );
        },
      );
    });
  }
}
