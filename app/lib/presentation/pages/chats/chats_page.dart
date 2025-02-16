import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
    ];

    return BaseScaffold(
      title: 'Chats',
      body: CupertinoScrollbar(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return CupertinoButton(
              onPressed: () {
                Get.toNamed('/chats/${entries[index]}');
              },
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Entry ${entries[index]}'),
                ),
                Spacer(),
              ]),
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
