import 'package:flutter/material.dart';
import 'classes.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.getName(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Priority: ${task.getPriority().join(", ")}',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Start Time: ${task.getStartTime()}',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Deadline: ${task.getDeadline()}',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Description: ${task.getDescription()}',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
