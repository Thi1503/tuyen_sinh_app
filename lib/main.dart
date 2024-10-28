
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuyen_sinh_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tuyen sinh app",
      home: HomeScreen(),
    );
  }
}