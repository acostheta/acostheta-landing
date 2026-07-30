import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 80, 32, 64),
      color: AppTheme.nearBlack,
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              '/images/afoto.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 100,
                height: 100,
                color: AppTheme.darkBrown,
                child: const Icon(Icons.person, color: AppTheme.white),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Luis Alberto\nAcosta Jiménez',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppTheme.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'AI-Assisted Mobile Developer',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: AppTheme.olive),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter  •  QA  •  Project Management',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppTheme.beige),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: 200,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.white,
                side: const BorderSide(color: AppTheme.white, width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text(
                'CONTACT',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
