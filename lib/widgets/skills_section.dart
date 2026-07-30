import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    ('Flutter & Dart', 'Mobile & Web'),
    ('Supabase', 'Backend & Auth'),
    ('Firebase', 'Backend & Hosting'),
    ('OpenCode', 'AI-Assisted Dev'),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      padding: EdgeInsets.fromLTRB(hPad(context), sectionGap(context), hPad(context), sectionGap(context)),
      color: AppTheme.cream,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stack',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Tecnologías que uso a diario',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: mobile ? 24 : 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = mobile ? constraints.maxWidth / 2 : 240.0;
              return Wrap(
                spacing: 0,
                runSpacing: 0,
                children: _skills.asMap().entries.map((e) {
                  return _buildItem(context, e.key, e.value.$1, e.value.$2,
                      itemWidth, mobile);
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index, String name, String cat,
      double w, bool mobile) {
    final isEven = index.isEven;
    return Container(
      width: w,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.beige.withOpacity(0.4)),
          right: !mobile && isEven
              ? BorderSide(color: AppTheme.beige.withOpacity(0.4))
              : mobile && index.isOdd
                  ? BorderSide.none
                  : BorderSide(color: AppTheme.beige.withOpacity(0.4)),
        ),
      ),
      child: Row(
        children: [
          Container(width: 4, height: 4, color: AppTheme.olive),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
