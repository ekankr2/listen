import 'package:app/controllers/home_controller.dart';
import 'package:app/presentation/widgets/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
              store.title,
              style: Get.theme.textTheme.bodyMedium,
            )),
          ],
        ),
      ),
    );
  }
}