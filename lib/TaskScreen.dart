import 'package:flutter/material.dart';
import 'classes.dart';
import 'TaskCard.dart';

class TasksScreen extends StatefulWidget {
  final Project project;

  TasksScreen({required this.project});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late TextEditingController taskNameController;
  late TextEditingController assignerNameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
    assignerNameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    assignerNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController startTimeController = TextEditingController();
    TextEditingController deadlineController = TextEditingController();
    TextEditingController priorityController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(labelText: 'Task Name'),
                ),
                TextField(
                  controller: startTimeController,
                  decoration: InputDecoration(labelText: 'Start Time'),
                ),
                TextField(
                  controller: deadlineController,
                  decoration: InputDecoration(labelText: 'Deadline'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: priorityController,
                  decoration: InputDecoration(labelText: 'Priority'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addTask(
                  startTimeController.text,
                  deadlineController.text,
                  int.tryParse(priorityController.text) ?? 1,
                );
                Navigator.pop(context);
              },
              child: Text('Add Task'),
            ),
          ],
        );
      },
    );
  }

  void _addTask(String startTime, String deadline, int priority) {
    print('Adding Task...');
    final newTask = Task(
      name: taskNameController.text,
      priority: [priority],
      assignerName: widget.project.getManager().getName(),
      progressLevel: [1],
      startTime: startTime,
      deadline: deadline,
      description: descriptionController.text,
    );

    setState(() {
      widget.project.getTasks().add(newTask);
    });

    print('Task Added: $newTask');
    taskNameController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.project.getName()} Tasks'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                for (Task task in widget.project.getTasks())
                  TaskCard(task: task),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
