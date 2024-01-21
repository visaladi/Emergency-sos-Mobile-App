import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/HomeScreen.dart';

class Logoutpage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> defaultImages = [
    'assets/default_image1.jpg',
    'assets/default_image2.jpg',
    'assets/default_image3.jpg',
    'assets/default_image4.jpg',
    // Add more default image paths as needed
  ];

  // Function to handle the logout process using Firebase authentication
  Future<void> _handleLogout(BuildContext context) async {
    try {
      // Sign out the user
      await _auth.signOut();

      // Navigate back to the previous page
      Navigator.pop(context);
    } catch (e) {
      // Handle errors (e.g., display an error message to the user)
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    // Randomly select a default image
    String randomDefaultImage =
    defaultImages[Random().nextInt(defaultImages.length)];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.brown,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: [
          // Add a Logout button to the app bar
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _handleLogout(context); // Call the logout function when the button is pressed
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/background_image4.jpg', // Replace with the path to your background image
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Display user image in a circle
                CircleAvatar(
                  backgroundImage: AssetImage(randomDefaultImage),
                  radius: 50,
                ),
                SizedBox(height: 16),
                // Display user details if available
                if (user != null)
                  Column(
                    children: [
                      Text(
                        'Welcome, ${user.displayName ?? user.email}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text('Email: ${user.email}'),
                    ],
                  ),
                // Add your other homepage content here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
