import 'package:flutter/material.dart';
import 'classes.dart';
import 'TaskCard.dart';

class TasksScreen extends StatelessWidget {
  final Project project;

  TasksScreen({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${project.getName()} Tasks'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            for (Task task in project.getTasks()) TaskCard(task: task),
          ],
        ),
      ),
    );
  }
}
