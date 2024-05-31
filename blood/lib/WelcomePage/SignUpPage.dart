import 'package:blood/HomePage/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, 
          password: _passwordController.text,
        );
        print("Created New Account");
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } catch (error) {
        print("Error ${error.toString()}");
        // Display error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${error.toString()}')),
        );
      }
    } else {
      print('Form is invalid');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.red),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgro.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            children: [
              SizedBox(height: 60),
              Text(
                'Create a new \n Account',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/LoginPage');
                },
                child: Text(
                  ' Already Registered? Login',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: _nameController,
                labelText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: _obscureText,
                suffixIcon: _buildVisibilityToggleIcon(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                obscureText: _obscureText,
                suffixIcon: _buildVisibilityToggleIcon(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }

  Widget _buildVisibilityToggleIcon() {
    return IconButton(
      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
      onPressed: _toggleVisibility,
    );
  }
}