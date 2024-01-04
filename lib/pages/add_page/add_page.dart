import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/service/database_client.dart';

class AddPage extends StatelessWidget {
  String _title = '', _content = '';

  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('추가'),
        actions: [
          TextButton(
            onPressed: () => DatabaseClient.instance
                .insert(
                  title: _title,
                  content: _content,
                  date: Get.arguments as String,
                )
                .then((value) => Get.back()),
            child: const Text('추가'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: '제목',
              ),
              onChanged: (value) => _title = value,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                onChanged: (value) => _content = value,
                decoration: const InputDecoration(
                  hintText: '내용',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
