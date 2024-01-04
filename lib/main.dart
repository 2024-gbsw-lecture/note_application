import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/pages/add_page/add_page.dart';
import 'package:note_application/pages/main_page/main_page.dart';
import 'package:note_application/pages/note_page/note_page.dart';
import 'package:note_application/service/database_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseClient.instance.initializeDatabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainPage(),
        ),
        GetPage(
          name: '/add',
          page: () => const AddPage(),
        ),
        GetPage(
          name: '/view',
          page: () => const NotePage(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
