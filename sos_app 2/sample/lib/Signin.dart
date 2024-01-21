import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';

class SigninPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SigninPage({super.key});

  Future<void> _createAccount(BuildContext context) async {
    String email = emailController.text.trim();
    String fullName = fullNameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      // Passwords do not match, handle this case accordingly
      print('Passwords do not match');
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // User creation successful
        print('Account created successfully. User ID: ${user.uid}');

        // Navigate to the login page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        print('Account creation failed.');
      }
    } catch (e) {
      // Handle errors during account creation
      print('Error during account creation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signin'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Signin",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 10, 28, 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 10, 28, 10),
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 10, 28, 10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 10, 28, 10),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            ),
            SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                // Call create account function
                _createAccount(context);
              },
              child: Text('Create Account'),
            ),
            SizedBox(height: 10),
            Text("already have an account"),
            SizedBox(height: 11),
            ElevatedButton(
              onPressed: () {
                // Handle the login process
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
