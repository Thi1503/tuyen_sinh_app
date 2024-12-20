
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuyen_sinh_app/screen/article_screen.dart';
import 'package:tuyen_sinh_app/screen/home_screen.dart';
import 'package:tuyen_sinh_app/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tuyen sinh app",
      home: HomeScreen(),
    );
  }
}