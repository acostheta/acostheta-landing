import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/services_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _contactKey = GlobalKey();

  void _scrollToContact() {
    final context = _contactKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(onContactTap: _scrollToContact),
            const ServicesSection(),
            const ExperienceSection(),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}
