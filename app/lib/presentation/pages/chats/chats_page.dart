import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:flutter/cupertino.dart';

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