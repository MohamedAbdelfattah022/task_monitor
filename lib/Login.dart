import 'package:flutter/material.dart';
import 'package:task_monitor/manager.dart';
import 'signup.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'filecontents.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var selectedRole = '';

  Future<bool> checkCredentials(
      String email, String password, String role) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${role}_data.txt');

      if (await file.exists()) {
        final lines = await file.readAsLines();
        print('lines: ${lines}');

        for (var line in lines) {
          print('line: ${line}');
          final userData = line
              .replaceAll('{', '')
              .replaceAll('}', '')
              .replaceAll('Employee', '')
              .replaceAll('Manager', '')
              .split(',');
          print('userdata: ${userData}');
          final storedEmail = userData
              .firstWhere((element) => element.contains('email'))
              .split(':')[1]
              .trim();
          final storedPassword = userData
              .firstWhere((element) => element.contains('password'))
              .split(':')[1]
              .trim();

          if (email == storedEmail && password == storedPassword) {
            print("FOUND");
            return true;
          }
        }
      }

      return false;
    } catch (e) {
      print('Error reading credentials: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 120,
                  ),
                  Text(
                    "Welcome back",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email Address",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Manager',
                        groupValue: selectedRole,
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value.toString();
                          });
                        },
                      ),
                      Text('Manager'),
                      Radio(
                        value: 'Employee',
                        groupValue: selectedRole,
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value.toString();
                          });
                        },
                      ),
                      Text('Employee'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final String enteredEmail = emailController.text;
                        final String enteredPassword = passwordController.text;
                        print('email: ${enteredEmail}');
                        print('password: ${enteredPassword}');
                        final bool validCredentials = await checkCredentials(
                            enteredEmail, enteredPassword, selectedRole);

                        if (validCredentials) {
                          if (selectedRole == 'Manager') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManagerScene()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileContentsPage(
                                  role: selectedRole,
                                ),
                              ),
                            );
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Login successful!',
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
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Invalid credentials. Please try again.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red,
                              elevation: 4.0,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          );
                        }

                        emailController.clear();
                        passwordController.clear();
                        // selectedRole = '';
                        setState(() {
                          selectedRole = '';
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text("Register Now"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FileContentsPage(
                            role: 'Manager',
                          ),
                        ),
                      );
                    },
                    child: Text('Manager Credentials (Testing)'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FileContentsPage(
                            role: 'Employee',
                          ),
                        ),
                      );
                    },
                    child: Text('Employee Credentials (Testing)'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
