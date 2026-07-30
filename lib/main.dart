import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'acostheta',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
