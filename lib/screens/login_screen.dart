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
    final passFocusNode = ref.watch(secondFocusNodeProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth < 600 ? 18 : 24;
        double buttonFontSize = constraints.maxWidth < 600 ? 24 : 32;
        double fieldHeight = constraints.maxWidth < 600 ? 50 : 60;

        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: fieldHeight,
                      child: TextFormField(
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: Appfonts.arista,
                          fontSize: fontSize,
                        ),
                        controller: emailTextController,
                        focusNode: emailFocusNode,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(passFocusNode);
                        },
                        decoration: InputDecoration(
                          labelText: 'email',
                          labelStyle: TextStyle(
                            color: AppColors.textSecondary.withOpacity(1),
                            fontFamily: Appfonts.arista,
                            fontSize: fontSize,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.accent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.accent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.accent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: fieldHeight,
                      child: TextFormField(
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: Appfonts.arista,
                          fontSize: fontSize,
                        ),
                        controller: passTextController,
                        focusNode: passFocusNode,
                        onFieldSubmitted: (value) {
                          loginAuth();
                        },
                        decoration: InputDecoration(
                          labelText: 'password',
                          labelStyle: TextStyle(
                            color: AppColors.textSecondary.withOpacity(1),
                            fontFamily: Appfonts.arista,
                            fontSize: fontSize,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.accent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.accent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.accent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: loginAuth,
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        side: WidgetStatePropertyAll(
                          BorderSide(color: AppColors.accent),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontFamily: Appfonts.arista,
                          fontSize: buttonFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              height: double.infinity,
              width: double.infinity,
            ),
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
                      fontSize: 32,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontFamily: Appfonts.arista,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This feature is not available yet.',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textPrimary,
                      fontFamily: Appfonts.arista,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void loginAuth() {}
}
