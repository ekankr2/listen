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
    final HomeController store = Get.find<HomeController>();

    return BaseScaffold(
      title: title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow_rounded,
                    color: CupertinoColors.systemGreen, size: 80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(Icons.close_rounded,
                            color: CupertinoColors.systemTeal, size: 50),
                        Text('Skip',
                            style: TextStyle(
                                fontSize: 13,
                                color: CupertinoColors.systemGrey
                                    .withOpacity(0.5)))
                      ],
                    )),
                CircleButton(
                    onPressed: () {},
                    child: Icon(Icons.save_alt,
                        color: CupertinoColors.systemBlue, size: 20)),
                CircleButton(
                    onPressed: () {},
                    padding: 17,
                    child: Column(children: [
                      Icon(CupertinoIcons.heart_solid,
                          color: CupertinoColors.systemPink, size: 40),
                      Text('Reply',
                          style: TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.systemGrey
                                  .withOpacity(0.5)))
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
