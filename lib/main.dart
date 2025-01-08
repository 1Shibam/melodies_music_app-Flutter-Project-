// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/screens/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  requestPermissions();
  runApp(const ProviderScope(child: MelodiesMusicApp()));
}

Future<void> requestPermissions() async {
  // Request storage permission on app startup
  PermissionStatus status = await Permission.storage.request();
  if (status.isGranted) {
    print('Permission granted');
  } else {
    print('Permission denied');
  }
}

class MelodiesMusicApp extends StatelessWidget {
  const MelodiesMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melodies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
