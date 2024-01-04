import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application/pages/add_page/add_page.dart';
import 'package:note_application/pages/note_page/note_page.dart';
import 'package:note_application/service/database_client.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 하루'),
      ),
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2300),
            onDateChanged: (value) {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  List<Map<String, dynamic>> data =
                      snapshot.hasData ? snapshot.data! : [];

                  return ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text('${data[index]['title']}'),
                        trailing: const IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: null,
                        ),
                        onTap: () => Get.toNamed('/view'),
                      ),
                    ),
                    itemCount: data.length,
                  );
                },
                future: DatabaseClient.instance.getDatasWithDate('2024-01-04'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
