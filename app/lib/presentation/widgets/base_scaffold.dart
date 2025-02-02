import 'package:app/controllers/navigation_controller.dart';
import 'package:flutter/cupertino.dart';
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

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: 'New Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
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
              navigationBar: CupertinoNavigationBar(
                leading: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(CupertinoIcons.settings),
                  onPressed: () {
                    Get.toNamed("/settings");
                  },
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
  }
}