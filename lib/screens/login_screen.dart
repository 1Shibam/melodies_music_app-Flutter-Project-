import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/providers/textcontroller_focusnode_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextController = ref.watch(firstTextControllerProvider);
    final passTextController = ref.watch(secondTextControllerProvider);
    final emailFocusNode = ref.watch(firstFocusNodeProvider);
    final passFocusNode = ref.watch(firstFocusNodeProvider);
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailTextController,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passFocusNode);
                },
                decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: TextStyle(
                        color: AppColors.textSecondary.withOpacity(0.4),
                        fontFamily: Appfonts.arista,
                        fontSize: 32),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: AppColors.accent))),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: passTextController,
                focusNode: passFocusNode,
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: TextStyle(
                        color: AppColors.textSecondary.withOpacity(0.4),
                        fontFamily: Appfonts.arista,
                        fontSize: 32),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: AppColors.accent))),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    shadowColor: WidgetStatePropertyAll(Colors.transparent),
                    side: WidgetStatePropertyAll(BorderSide(
                      color: AppColors.accent,
                    ))),
                child: const Text('Login'),
              )
            ],
          ),
        )),
        BackdropFilter(
          blendMode: BlendMode.softLight,
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0), // Blur intensity
          child: Container(
            color: Colors.black.withOpacity(0.1), // Semi-transparent overlay
          ),
        ),

        // Centered lock icon and text
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock,
                size: 100,
                color: AppColors.primary,
              ),
              SizedBox(height: 16),
              Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'This feature is not available yet.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
