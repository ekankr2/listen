import 'package:app/app/routes/app_pages.dart';
import 'package:app/controllers/navigation_controller.dart';
import 'package:app/controllers/store_controller.dart';
import 'package:app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Listen',
      theme: mainCupertinoTheme,
      initialRoute: '/',
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(StoreController());
        Get.put(NavigationController());
      }),
    );
  }
}

