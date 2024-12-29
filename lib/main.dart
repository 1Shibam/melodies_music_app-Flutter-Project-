import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/screens/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MelodiesMusicApp()));
}

class MelodiesMusicApp extends StatelessWidget {
  const MelodiesMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
