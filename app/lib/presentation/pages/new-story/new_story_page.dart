import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:app/presentation/widgets/buttons/circle_button.dart';
import 'package:app/presentation/widgets/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewStoryPage extends StatelessWidget {
  const NewStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'New Story',
      body: Center(
        child: Column(
          spacing: 60,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
                padding: 24,
                onPressed: () {},
                child: Icon(Icons.mic_rounded,
                    color: Colors.redAccent, size: 110)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pill(color: CupertinoColors.systemGrey3, text: 'example'),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text("You won't believe what happened to me today...",
                        style: TextStyle(
                            fontSize: 15,
                            color: CupertinoColors.systemGrey.withOpacity(0.8))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
