import 'dart:core';
import 'dart:math';

class Person {
  late String _name;
  late String _email;
  late String _password;

  Person(
      {required String name, required String email, required String password}) {
    _name = name;
    _email = email;
    _password = password;
  }
  @override
  String toString() {
    return 'Person{name: $_name, email: $_email, password: $_password}';
  }

  // Getters
  String getName() => _name;
  String getEmail() => _email;
  String getPassword() => _password;
  // Setters
  void setName(String name) {
    _name = name;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }
}

class Employee extends Person {
  late List<Task> _requests;
  late int _maxRequests;
  late String _managerName;

  Employee(
      {required String name, required String email, required String password})
      : super(name: name, email: email, password: password);

  Employee.defaults() : super(name: '', email: '', password: '');

  @override
  String toString() {
    return '{name: $_name, email: $_email, password: $_password}';
  }

  // Getters
  List<Task> getRequests() => _requests;
  int getMaxRequests() => _maxRequests;
  String getManagerName() => _managerName;

  // Setters
  void setRequests(List<Task> requests) {
    _requests = requests;
  }

  void setMaxRequests(int maxRequests) {
    _maxRequests = maxRequests;
  }

  void setManagerName(String managerName) {
    _managerName = managerName;
  }
}

class Manager extends Person {
  late List<Project> _projects = [];
  late List<Employee> _employees = [];

  Manager({
    required String name,
    required String email,
    required String password,
  }) : super(name: name, email: email, password: password);

  Manager.defaults() : super(name: '', email: '', password: '');

  @override
  String toString() {
    return '{name: $_name, email: $_email, password: $_password}';
  }

  // Getters
  List<Project> getProjects() => _projects;
  List<Employee> getEmployees() => _employees;

  // Setters
  void setProjects(List<Project> projects) {
    _projects = projects;
  }

  void setEmployees(List<Employee> employees) {
    _employees = employees;
  }
}

class Project {
  late String name;
  late String _description;
  late List<Task> _tasks;
  late List<Employee> _employees;
  late Manager _manager;
  late List<int> _progressLevel = [1, 2, 3];
  late String _startTime;
  late String _deadline;

  Project({
    required String name,
    required String description,
    required List<Task> tasks,
    required List<Employee> employees,
    required Manager manager,
    required String startTime,
    required String deadline,
  }) {
    this.name = name;
    this._description = description;
    this._tasks = tasks;
    this._employees = employees;
    this._manager = manager;
    this._startTime = startTime;
    this._deadline = deadline;
  }

  // Getters
  List<Task> getTasks() => _tasks;
  List<Employee> getEmployees() => _employees;
  Manager getManager() => _manager;
  List<int> getProgressLevel() => _progressLevel;
  String getStartTime() => _startTime;
  String getDeadline() => _deadline;
  String getDescription() => _description;
  String getName() => name;

  // Setters
  void setTasks(List<Task> tasks) {
    _tasks = tasks;
  }

  void setEmployees(List<Employee> employees) {
    _employees = employees;
  }

  void setManager(Manager manager) {
    _manager = manager;
  }

  void setProgressLevel(List<int> progressLevel) {
    _progressLevel = progressLevel;
  }

  void setStartTime(String startTime) {
    _startTime = startTime;
  }

  void setDeadline(String deadline) {
    _deadline = deadline;
  }

  void setDescription(String description) {
    _description = description;
  }
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

  Task({
    required String name,
    required List<int> priority,
    required String assignerName,
    required List<int> progressLevel,
    required String startTime,
    required String deadline,
    required String description,
  }) {
    _name = name;
    _priority = priority;
    _assignerName = assignerName;
    _progressLevel = progressLevel;
    _startTime = startTime;
    _deadline = deadline;
    _description = description;
  }
  // Getters
  String getName() => _name;
  Project getProject() => _project;
  List<int> getPriority() => _priority;
  String getAssignerName() => _assignerName;
  List<int> getProgressLevel() => _progressLevel;
  String getStartTime() => _startTime;
  String getDeadline() => _deadline;
  String getDescription() => _description;
}
