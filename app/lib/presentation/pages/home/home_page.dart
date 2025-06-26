import 'package:app/controllers/home_controller.dart';
import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:app/presentation/widgets/buttons/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return BaseScaffold(
      title: title,
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(
              controller.hasCurrentMessage 
                ? 'New voice message from someone nearby...'
                : 'Looking for new voices...',
              style: TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
              ),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: 20),
            Obx(() => CircleButton(
                onPressed: controller.hasCurrentMessage 
                  ? () => controller.playCurrentMessage() 
                  : () {},
                child: Icon(
                  controller.isPlaying 
                    ? Icons.pause_rounded 
                    : Icons.play_arrow_rounded,
                  color: controller.hasCurrentMessage 
                    ? CupertinoColors.systemGreen 
                    : CupertinoColors.systemGrey,
                  size: 90
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => CircleButton(
                    onPressed: controller.hasCurrentMessage 
                      ? () => controller.skipCurrentMessage() 
                      : () {},
                    child: Column(
                      children: [
                        Icon(Icons.close_rounded,
                            color: controller.hasCurrentMessage 
                              ? CupertinoColors.systemTeal 
                              : CupertinoColors.systemGrey,
                            size: 50),
                        Text('Skip',
                            style: TextStyle(
                                fontSize: 13,
                                color: CupertinoColors.systemGrey
                                    .withOpacity(0.5)))
                      ],
                    ))),
                CircleButton(
                    onPressed: () {},
                    child: Icon(Icons.save_alt,
                        color: CupertinoColors.systemBlue, size: 20)),
                Obx(() => CircleButton(
                    onPressed: controller.hasCurrentMessage 
                      ? () => controller.replyToCurrentMessage() 
                      : () {},
                    padding: 17,
                    child: Column(children: [
                      Icon(CupertinoIcons.heart_solid,
                          color: controller.hasCurrentMessage 
                            ? CupertinoColors.systemPink 
                            : CupertinoColors.systemGrey,
                          size: 40),
                      Text('Reply',
                          style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.systemGrey
                                  .withOpacity(0.5)))
                    ]))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
