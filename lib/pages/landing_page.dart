import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/services_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            SkillsSection(),
            ServicesSection(),
            ExperienceSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
