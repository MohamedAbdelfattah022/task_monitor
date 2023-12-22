import 'dart:core';
import 'dart:math';

class Person {
  late String _name;
  late String _email;
  late String _password;
  late int _id;

  void login() {}
  void logout() {}
  void signup() {}
}

class Employee extends Person {
  late List<Task> _requests;
  late int _maxRequests;
  late String _managerName;

  void showTasks() {}
  void updateTask() {}
  void checkTask() {}
  void askForHelp() {}
  void showRequests() {}
}

class Manager extends Person {
  late List<Project> _projects;
  late List<Employee> _employees;

  void showProjects() {}
  void editProject() {}
  void showEmployees() {}
  void assignTask() {}
  void removeTask() {}
  void editTask() {}
}

class Project {
  late String name;
  late List<Task> _tasks;
  late List<Employee> _employees;
  late Manager _manager;
  late List<int> _progressLevel = [1, 2, 3];
  late String _startTime;
  late String _deadline;
  late String _description;
}

class Task {
  late String _name;
  late Project _project;
  late List<int> _priority = [1, 2, 3];
  late String _assignerName;
  late List<int> _progressLevel = [1, 2, 3];
  late String _startTime;
  late String _deadline;
  late String _description;
}
