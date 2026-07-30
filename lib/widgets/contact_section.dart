import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 80, 32, 80),
      color: AppTheme.nearBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: AppTheme.white),
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              _contactLink('LinkedIn', 'linkedin.com/in/acostheta'),
              const SizedBox(width: 48),
              _contactLink('X', 'x.com/acostheta'),
              const SizedBox(width: 48),
              _contactLink('Instagram', 'instagram.com/acostheta'),
            ],
          ),
          const SizedBox(height: 48),
          const Divider(color: AppTheme.darkBrown),
          const SizedBox(height: 24),
          Text(
            '© 2026 Luis Acosta',
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.beige.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactLink(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppTheme.beige,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: AppTheme.white,
          ),
        ),
      ],
    );
  }
}
