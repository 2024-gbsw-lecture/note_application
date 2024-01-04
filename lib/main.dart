import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/pages/main_page/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MainPage(),
    );
  }
}
