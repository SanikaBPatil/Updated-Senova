import 'package:flutter/material.dart';
import 'first.dart';  // Import home page
import 'login.dart'; // Import login page (if needed elsewhere)
import 'signup_professional_info.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctors App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageWidget(), // Set the HomePageWidget as the initial page
    );
  }
}