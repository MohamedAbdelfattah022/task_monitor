import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'Login.dart';

class SignUp extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  Future<void> saveCredentials(String email, String password) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/credentials.txt');
      await file.writeAsString('$email,$password\n', mode: FileMode.append);
      print('Credentials saved successfully.');
    } catch (e) {
      print('Error saving credentials: $e');
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
                    Icons.person_add,
                    size: 120,
                  ),
                  Text(
                    "Create an Account",
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
                  TextField(
                    controller: confirmPasswordController,
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
                      hintText: "Confirm Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        print(emailController.text);
                        print(passwordController.text);
                        print(confirmPasswordController.text);

                        // Save credentials to a file
                        await saveCredentials(
                            emailController.text, passwordController.text);

                        emailController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text("Log In"),
                      ),
                    ],
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
