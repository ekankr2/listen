import 'package:app/controllers/navigation_controller.dart';
import 'package:app/presentation/widgets/buttons/circle_button.dart';
import 'package:app/presentation/widgets/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewStoryPage extends StatelessWidget {
  const NewStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('New Story'),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
                padding: 24,
                onPressed: () {},
                child: Icon(Icons.mic_rounded,
                    color: Colors.redAccent, size: 110)),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pill(color: CupertinoColors.systemGrey3, text: 'example'),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                        "You won't believe what happened to me today...",
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                CupertinoColors.systemGrey.withOpacity(0.8))),
                  ),
                ],
              ),
            )
          ],
        )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 28).copyWith(bottom: 48),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor:
                          CupertinoColors.black.withValues(alpha: 0.8),
                      padding: EdgeInsets.symmetric(vertical: 14)),
                  onPressed: () {},
                  child: Text(
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                      'Send')),
            ))
      ]),
    );
  }
}
