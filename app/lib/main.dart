import 'package:app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Listen',
      theme: mainCupertinoTheme,
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const MyHomePage(title: 'Listen'),
            transition: Transition.noTransition),
        GetPage(
            name: '/chats',
            page: () => const Chats(),
            transition: Transition.noTransition),
        GetPage(
          name: '/settings',
          page: () => const Settings(),
        )
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(StoreController());
        Get.put(NavigationController());
      }),
    );
  }
}

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
                middle: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final StoreController store = Get.find<StoreController>();

    return BaseScaffold(
      title: title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
              store.name.value,
              style: Theme.of(context).textTheme.headlineMedium,
            )),
          ],
        ),
      ),
    );
  }
}

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Chats',
      body: Center(
        child: Text("Chats Page"),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Settings'),
        ),
        child: const Text("settings")
    );
  }
}

class StoreController extends GetxController {
  var name = 'paul kim'.obs;

  void changeName() {
    name.value = 'jane doe';
  }
}

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed('/');
        break;
      case 1:
        Get.offAllNamed('/new-chat');
        break;
      case 2:
        Get.offAllNamed('/chats');
        break;
    }
  }
}
