import 'package:facebook/notification.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'notification.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FacebookHome (),
    );
  }
}

