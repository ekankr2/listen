import 'package:app/controllers/home_controller.dart';
import 'package:app/presentation/widgets/base_scaffold.dart';
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
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: CupertinoColors.systemGrey.withValues(alpha: 0.15),
                      width: 11),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withValues(alpha: 0.3),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Icon(Icons.play_arrow_rounded,
                    color: CupertinoColors.systemGreen, size: 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
