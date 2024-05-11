import 'package:blood/RegisterPage/RegisterPage.dart';
import 'package:blood/WelcomePage/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:blood/controlles/FirebaseService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  final FirebaseService _auth = FirebaseService();
  String _errorText = ''; // Error message text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email TextField
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Red border color
                ),
                labelStyle: TextStyle(
                    color: Color.fromARGB(
                        255, 229, 239, 198)), // Blue label text color
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 16.0),
            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Red border color
                ),
                labelStyle: TextStyle(
                    color: Color.fromARGB(
                        255, 144, 211, 89)), // Blue label text color
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 16.0),
            // Error Text (Displayed conditionally)
            Text(
              _errorText,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16.0),
            // Login Button
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;

                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (userCredential.user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WelcomePage()), // Navigate to HomePage
                    );
                  }
                } catch (e) {
                  setState(() {
                    _errorText =
                        'Incorrect email or password'; // Set error message
                  });
                  print("Error occurred: $e");
                }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // White text color
                backgroundColor: Colors.red, // Red button color
              ),
            ),
            SizedBox(height: 8.0), // Add some space between buttons
            // Register Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RegisterPage()), // Navigate to SignUpPage
                );
              },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // White text color
                backgroundColor: Colors.blue, // Blue button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
