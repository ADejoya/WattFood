import 'package:flutter/material.dart';
import 'package:wattfood/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

// start ng app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WattFood',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}
