import 'package:app/presentation/pages/chats/chats_page.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/new-story/new_story_page.dart';
import 'package:app/presentation/pages/settings/settings_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
        name: '/',
        page: () => const HomePage(title: 'Listen'),
    ),
    GetPage(
        name: '/new-story',
        page: () => const NewStoryPage(),
        ),
    GetPage(
        name: '/chats',
        page: () => const ChatsPage(),
        transition: Transition.noTransition),
    GetPage(
      name: '/settings',
      page: () => const Settings(),
    )
  ];
}

abstract class Routes {
  static const home = '/';
  static const newStory = '/new-story';
  static const chats = '/chats';
  static const settings = '/settings';
}
