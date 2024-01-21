import 'package:flutter/material.dart';
import 'package:sample/Home.dart';
import 'package:sample/HomeScreen.dart';
import 'package:sample/Logout.dart';
import 'package:sample/Pages/Fire.dart';
import 'Signin.dart';
//import 'main.dart';
import 'HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle the login process using Firebase authentication
  Future<void> _handleLogin(BuildContext context) async {
    try {
      // Get user input from text fields
      String email = 'user@example.com'; // replace with your text field value
      String password = 'password123'; // replace with your text field value

      // Sign in with email and password
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // If successful, check if the user is logged in and navigate to the main page
      if (_auth.currentUser != null) {
        print('Login successful!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      // Handle errors (e.g., display an error message to the user)
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user is already authenticated
    if (_auth.currentUser != null) {
      // If authenticated, navigate to the main page
      return Logoutpage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Login",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Container(
              margin: const EdgeInsets.all(28),
              child: const TextField(
                decoration: InputDecoration(labelText: 'Email'),
                //obscureText: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(28),
              child: const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _handleLogin(context); // Call the login function when the button is pressed
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            const Text("Don't have an account"),
            const SizedBox(height: 11),
            ElevatedButton(
              onPressed: () {
                // Navigate to the SigninPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SigninPage()),
                );
              },
              child: Text('Signin'),
            ),
          ],
        ),
      ),
    );
  }
}
