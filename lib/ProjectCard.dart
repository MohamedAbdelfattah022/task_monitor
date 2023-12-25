import 'package:flutter/material.dart';
import 'classes.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            project.getName(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              project.getDescription(),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Start Time: ${project.getStartTime()}',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Deadline: ${project.getDeadline()}',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
