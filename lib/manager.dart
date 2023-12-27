import 'package:flutter/material.dart';
import 'classes.dart';
import 'ProjectCard.dart';
import 'TaskScreen.dart';

class ManagerScene extends StatefulWidget {
  @override
  _ManagerSceneState createState() => _ManagerSceneState();
}

class _ManagerSceneState extends State<ManagerScene> {
  Manager manager = Manager.defaults();
  List<Project> projects = [];

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
                      _showAddProjectDialog(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              for (Project project in projects)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TasksScreen(project: project),
                      ),
                    );
                  },
                  child: ProjectCard(project: project),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddProjectDialog(BuildContext context) async {
    TextEditingController projectNameController = TextEditingController();
    TextEditingController projectDescriptionController =
        TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a New Project'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Project Name:'),
              TextField(
                controller: projectNameController,
                decoration: InputDecoration(hintText: 'Enter project name'),
              ),
              SizedBox(height: 10),
              Text('Project Description:'),
              TextField(
                controller: projectDescriptionController,
                decoration:
                    InputDecoration(hintText: 'Enter project description'),
              ),
              SizedBox(height: 10),
              Text('Start Time:'),
              TextField(
                controller: startTimeController,
                decoration: InputDecoration(hintText: 'Enter start time'),
              ),
              SizedBox(height: 10),
              Text('End Time:'),
              TextField(
                controller: endTimeController,
                decoration: InputDecoration(hintText: 'Enter end time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Project newProject = Project(
                  name: projectNameController.text,
                  description: projectDescriptionController.text,
                  tasks: [],
                  employees: [],
                  manager: manager,
                  startTime: startTimeController.text,
                  deadline: endTimeController.text,
                );

                setState(() {
                  manager.getProjects().add(newProject);
                  projects.add(newProject);
                });

                Navigator.pop(context);
              },
              child: Text('Add Project'),
            ),
          ],
        );
      },
    );
  }
}
