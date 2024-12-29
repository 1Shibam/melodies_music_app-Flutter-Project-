import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MelodiesMusicApp()));
}

class MelodiesMusicApp extends StatelessWidget {
  const MelodiesMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
    );
  }
}
