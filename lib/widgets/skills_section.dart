import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    ('Flutter', Icons.phone_android, 'Mobile & Web'),
    ('Dart', Icons.code, 'Lenguaje'),
    ('Supabase', Icons.storage, 'Backend & Auth'),
    ('Firebase', Icons.local_fire_department, 'Backend & Hosting'),
    ('Riverpod', Icons.alt_route, 'State Management'),
    ('Gemini AI', Icons.auto_awesome, 'AI Ecosystem'),
    ('DeepSeek', Icons.psychology, 'AI Ecosystem'),
    ('QA Testing', Icons.bug_report, 'Testing & QA'),
    ('Git/GitHub', Icons.source, 'Version Control'),
    ('Project Mgmt', Icons.assignment, 'Management'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      color: AppTheme.surface,
      child: Column(
        children: [
          Text(
            'Tech Stack & Habilidades',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Tecnologías y herramientas que uso para construir soluciones sólidas',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: _skills.map((s) => _SkillCard(s.$1, s.$2, s.$3)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final String category;

  const _SkillCard(this.name, this.icon, this.category);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32, color: AppTheme.primary),
              const SizedBox(height: 8),
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13)),
              const SizedBox(height: 4),
              Text(category,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.shade600)),
            ],
          ),
        ),
      ),
    );
  }
}
