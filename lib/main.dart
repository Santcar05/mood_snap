import 'package:flutter/material.dart';
import 'presentation/screens/splash_screen.dart';

void main() => runApp(const MoodSnapApp());

class MoodSnapApp extends StatelessWidget {
  const MoodSnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoodSnap',
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true, // Estética moderna
      ),
      home: const SplashScreen(),
    );
  }
}
