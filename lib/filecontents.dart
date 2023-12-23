import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileContentsPage extends StatelessWidget {
  final String role;

  FileContentsPage({required this.role});

  Future<List<String>> readFileContents() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${role}_data.txt');

      if (await file.exists()) {
        final lines = await file.readAsLines();
        return lines;
      } else {
        return ['File not found'];
      }
    } catch (e) {
      print('Error reading file contents: $e');
      return ['Error reading file contents'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Contents'),
      ),
      body: FutureBuilder<List<String>>(
        future: readFileContents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final lines = snapshot.data ?? ['No contents'];

            final formattedContents = lines
                .map((line) => line.replaceAll('{', '').replaceAll('}', ''))
                .join('\n');

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(formattedContents),
            );
          }
        },
      ),
    );
  }
}
