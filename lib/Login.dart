// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'filecontents.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<bool> checkCredentials(String email, String password) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/credentials.txt');

      if (await file.exists()) {
        final lines = await file.readAsLines();

        for (var line in lines) {
          final storedEmail = line.split(',')[0];
          final storedPassword = line.split(',')[1];

          if (email == storedEmail && password == storedPassword) {
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
                      )),
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
                        hintText: "Password"),
                    obscureText: true,
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
                      // color: Colors.black,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final enteredEmail = emailController.text;
                        final enteredPassword = passwordController.text;

                        final validCredentials = await checkCredentials(
                            enteredEmail, enteredPassword);

                        if (validCredentials) {
                          // Navigate to the content page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FileContentsPage()),
                          );
                        } else {
                          // Show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Invalid credentials. Please try again.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }

                        emailController.clear();
                        passwordController.clear();
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
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text("Register Now"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Testing button to directly go to the content page
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the content page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FileContentsPage()),
                      );
                    },
                    child: Text('User Credentials (Testing)'),
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
