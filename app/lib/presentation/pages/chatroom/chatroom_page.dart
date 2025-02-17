import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> entries = <String>[
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
      'K', 'L', 'M', 'N', 'O',
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Chat Room'),
      ),
      child: CupertinoScrollbar(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoButton(
              onPressed: () {
                Get.toNamed('/chatroom/${entries[index]}');
              },
              child: Container(
                height: 50,
                child: Center(
                  child: Text('Entry ${entries[index]}'),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
      ),
    );
  }
}

