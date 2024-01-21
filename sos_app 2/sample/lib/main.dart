import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'contact/AddEmergency.dart';
import 'contact/CallEmergency.dart';
import 'Home.dart';
import 'firebase_options.dart';
import 'HomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}


