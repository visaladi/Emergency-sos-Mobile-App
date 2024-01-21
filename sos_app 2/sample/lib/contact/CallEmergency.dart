import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class CallEmergencyPage extends StatefulWidget {
  @override
  _CallEmergencyPageState createState() => _CallEmergencyPageState();
}

class _CallEmergencyPageState extends State<CallEmergencyPage> {
  final CollectionReference _collection =
  FirebaseFirestore.instance.collection('emergency_contacts');
  late List<Map<String, dynamic>> contacts;

  @override
  void initState() {
    super.initState();
    _loadEmergencyContacts();
  }

  Future<void> _loadEmergencyContacts() async {
    try {
      QuerySnapshot querySnapshot = await _collection.get();
      contacts = querySnapshot.docs
          .map((DocumentSnapshot document) => document.data() as Map<String, dynamic>)
          .toList();

      // Rebuild the widget tree to display the updated contact list
      setState(() {});
    } catch (e) {
      print('Error loading emergency contacts: $e');
    }
  }

  Future<void> _callContact(String contactNo) async {
    String phoneNumber = 'tel:$contactNo';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      print('Could not launch $phoneNumber');
    }
  }

  Future<void> _sendSms(String contactNo, String message) async {
    String smsUri = 'sms:$contactNo?body=$message';
    if (await canLaunch(smsUri)) {
      await launch(smsUri);
    } else {
      print('Could not launch $smsUri');
    }
  }

  Future<void> _sendHelpMessage(String contactNo) async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      String message = 'Help! I need assistance. My current location: '
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';

      // Send SMS with help message
      await _sendSms(contactNo, message);
    } catch (e) {
      print('Error sending help message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> contact = contacts[index];
          return ListTile(
            title: Text(contact['name']),
            subtitle: Text(contact['relation']),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                _callContact(contact['contactNo']);
              },
            ),
            onTap: () {
              _sendHelpMessage(contact['contactNo']);
            },
          );
        },
      ),
    );
  }
}
