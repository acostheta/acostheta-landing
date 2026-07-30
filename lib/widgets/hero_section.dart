import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(hPad(context), mobile ? 64 : 80, hPad(context), mobile ? 48 : 64),
      color: AppTheme.nearBlack,
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              '/images/afoto.jpg',
              width: mobile ? 80 : 100,
              height: mobile ? 80 : 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: mobile ? 80 : 100,
                height: mobile ? 80 : 100,
                color: AppTheme.darkBrown,
                child: Icon(Icons.person, color: AppTheme.white, size: mobile ? 48 : 60),
              ),
            ),
          ),
          SizedBox(height: mobile ? 24 : 32),
          Text(
            'Luis Alberto\nAcosta Jiménez',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppTheme.white, fontSize: mobile ? 28 : 40),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mobile ? 12 : 16),
          Text(
            'AI-Assisted Mobile Developer',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: AppTheme.olive, fontSize: mobile ? 22 : 28),
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
          SizedBox(height: mobile ? 36 : 48),
          SizedBox(
            width: mobile ? double.infinity : 200,
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
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
