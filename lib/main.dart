import 'package:flutter/material.dart';
import 'package:flutter_staggered_sir_assigment/profile_animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      ),
      home: const ProfileAnimationScreen(),
    );
  }
}
