import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
          hPad(context), sectionGap(context), hPad(context), sectionGap(context)),
      color: AppTheme.nearBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contacto',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: AppTheme.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (mobile) ...[
            _contactLink('LinkedIn', 'linkedin.com/in/acostheta'),
            const SizedBox(height: 16),
            _contactLink('X', 'x.com/acostheta'),
            const SizedBox(height: 16),
            _contactLink('Instagram', 'instagram.com/acostheta'),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _contactLink('LinkedIn', 'linkedin.com/in/acostheta'),
                const SizedBox(width: 48),
                _contactLink('X', 'x.com/acostheta'),
                const SizedBox(width: 48),
                _contactLink('Instagram', 'instagram.com/acostheta'),
              ],
            ),
          ],
          const SizedBox(height: 48),
          const Divider(color: AppTheme.darkBrown),
          const SizedBox(height: 24),
          Text(
            '© 2026 Luis Acosta',
            textAlign: TextAlign.center,
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
          style: const TextStyle(fontSize: 14, color: AppTheme.white),
        ),
      ],
    );
  }
}
