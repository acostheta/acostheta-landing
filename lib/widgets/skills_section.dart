import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    ('Flutter', 'Framework'),
    ('Dart', 'Language'),
    ('Supabase', 'Backend'),
    ('Firebase', 'Backend'),
    ('Riverpod', 'State'),
    ('Gemini AI', 'AI Tools'),
    ('DeepSeek', 'AI Tools'),
    ('QA Testing', 'Testing'),
    ('Git/GitHub', 'DevOps'),
    ('Project Mgmt', 'Management'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 80, 32, 80),
      color: AppTheme.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stack',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Tecnologías y herramientas que uso',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 0,
            runSpacing: 0,
            children: _skills.asMap().entries.map((e) {
              return _buildRow(context, e.key, e.value.$1, e.value.$2);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index, String name, String cat) {
    final isEven = index.isEven;
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.beige.withOpacity(0.4)),
          right: isEven
              ? BorderSide(color: AppTheme.beige.withOpacity(0.4))
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            color: AppTheme.olive,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppTheme.nearBlack)),
              const SizedBox(height: 2),
              Text(cat,
                  style: const TextStyle(
                      fontSize: 12, color: AppTheme.darkBrown)),
            ],
          ),
        ],
      ),
    );
  }
}
