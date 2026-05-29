import 'package:flutter/material.dart';
import 'package:fitstart_app/theme.dart';
import 'package:fitstart_app/screens/onboarding.dart';
import 'package:fitstart_app/screens/auth.dart';
import 'package:fitstart_app/screens/registration.dart';
import 'package:fitstart_app/screens/home.dart';

void main() {
  runApp(const FitStartApp());
}

class FitStartApp extends StatelessWidget {
  const FitStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitStart',
      theme: buildAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/auth': (context) => const AuthPage(),
        '/registration': (context) => const RegistrationPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
