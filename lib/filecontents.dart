import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileContentsPage extends StatelessWidget {
  Future<String> readFileContents() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/credentials.txt');

      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return 'File not found';
      }
    } catch (e) {
      print('Error reading file contents: $e');
      return 'Error reading file contents';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Contents'),
      ),
      body: FutureBuilder<String>(
        future: readFileContents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final contents = snapshot.data ?? 'No contents';
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(contents),
            );
          }
        },
      ),
    );
  }
}
