import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/chats/pages/chats_page.dart';
import '../../features/chat/pages/chatroom_page.dart';
import '../../features/story/pages/new_story_page.dart';
import '../../features/settings/pages/settings_page.dart';
import '../presentation/shell/main_shell.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) => const CupertinoPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/chats',
            name: 'chats',
            pageBuilder: (context, state) => const CupertinoPage(
              child: ChatsPage(),
            ),
          ),
          GoRoute(
            path: '/new-story',
            name: 'new-story',
            pageBuilder: (context, state) => const CupertinoPage(
              child: NewStoryPage(),
            ),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder: (context, state) => const CupertinoPage(
              child: SettingsPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/chat/:chatId',
        name: 'chatroom',
        pageBuilder: (context, state) {
          final chatId = state.pathParameters['chatId']!;
          final chatName = state.uri.queryParameters['name'] ?? 'Chat';
          return CupertinoPage(
            child: ChatRoomPage(
              chatId: chatId,
              chatName: chatName,
            ),
          );
        },
      ),
    ],
  );
}