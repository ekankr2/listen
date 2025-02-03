import 'package:app/app/initial_binding.dart';
import 'package:app/app/routes.dart';
import 'package:app/app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://jdrtxofrlkcfxicyuejw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkcnR4b2ZybGtjZnhpY3l1ZWp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg2MDA2NjQsImV4cCI6MjA1NDE3NjY2NH0.L4C9of1LLsM84ATecAcNmqN-okh7HS9_r7CvRPZSNuw',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Listen',
      theme: mainCupertinoTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    );
  }
}
