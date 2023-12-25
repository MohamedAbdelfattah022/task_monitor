import 'package:flutter/material.dart';
import 'classes.dart';
import 'ProjectCard.dart';
import 'TaskScreen.dart';

class ManagerScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back, Manager!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text('Log out'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Logged out',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          elevation: 4.0,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text('Add a new project'),
                    onPressed: () {
                      // add new project functionality
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TasksScreen(
                        project: Project(
                          name: 'Project #1',
                          description: 'This is the first project',
                          tasks: [
                            Task(
                              name: 'Task 1',
                              priority: [1],
                              assignerName: 'Assigner 1',
                              progressLevel: [1],
                              startTime: 'Start Time 1',
                              deadline: 'Deadline 1',
                              description: 'Description 1',
                            ),
                            Task(
                              name: 'Task 2',
                              priority: [2],
                              assignerName: 'Assigner 2',
                              progressLevel: [2],
                              startTime: 'Start Time 2',
                              deadline: 'Deadline 2',
                              description: 'Description 2',
                            ),
                          ],
                          employees: [],
                          manager: Manager(),
                          startTime: 'Wednesday, 11 November 2023, 05 : 15 P.M',
                          deadline: 'Thursday, 12 November 2023, 05 : 15 P.M',
                        ),
                      ),
                    ),
                  );
                },
                child: ProjectCard(
                  project: Project(
                    name: 'Project #1',
                    description: 'This is the first project',
                    tasks: [],
                    employees: [],
                    manager: Manager(),
                    startTime: 'Wednesday, 11 November 2023, 05 : 15 P.M',
                    deadline: 'Thursday, 12 November 2023, 05 : 15 P.M',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
