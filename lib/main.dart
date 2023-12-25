import 'package:flutter/material.dart';
import 'package:task_monitor/Login.dart';
import 'package:task_monitor/signup.dart';
import 'package:task_monitor/manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
