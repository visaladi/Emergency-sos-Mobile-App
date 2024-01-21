import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEmergencyPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _collection =
  FirebaseFirestore.instance.collection('emergency_contacts');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController relationController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController otherNoController = TextEditingController();

  AddEmergencyPage({Key? key});

  Future<void> _addEmergencyContact() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String userEmail = user.email ?? ''; // Get the current user's email

        String name = nameController.text.trim();
        String relation = relationController.text.trim();
        String contactNo = contactNoController.text.trim();
        String otherNo = otherNoController.text.trim();

        if (userEmail.isNotEmpty && name.isNotEmpty) {
          // Add a new document with the user's email as the document ID
          await _collection.doc(userEmail).set({
            'name': name,
            'relation': relation,
            'contactNo': contactNo,
            'otherNo': otherNo,
          });

          print('Emergency contact added successfully!');
        } else {
          print('User email or Name is empty.');
        }
      } else {
        print('User is not logged in.');
      }
    } catch (e) {
      print('Error adding emergency contact: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Emergency Number'),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/addcontact.jpg', // Replace with your image file path
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "ADD the contact",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  _buildTextField(nameController, 'Name'),
                  _buildTextField(relationController, 'Relation'),
                  _buildTextField(contactNoController, 'Contact NO'),
                  _buildTextField(otherNoController, 'Other No'),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {
                      _addEmergencyContact();
                    },
                    child: const Text('Add Contact'),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "already have account",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      margin: EdgeInsets.fromLTRB(28, 10, 28, 10),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
