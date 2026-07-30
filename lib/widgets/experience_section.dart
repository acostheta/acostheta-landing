import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _experiences = [
    _Experience(
      period: '12/2025 – 07/2026',
      role: 'Flutter Developer',
      subtitle: 'Progrese Asesoría · México (Remoto)',
      bullets: [
        'Apps multiplataforma Android/Web con Flutter, Dart, Riverpod y Supabase.',
        'Orquestación de agentes IA para co-creación de código y debugging.',
        'Auto-QA con casos de prueba detallados previo a releases.',
        'Despliegue de PWAs y builds para Google Play Store.',
      ],
    ),
    _Experience(
      period: '10/2024 – 12/2025',
      role: 'Web & No-Code Developer',
      subtitle: 'Progrese Asesoría · México (Remoto)',
      bullets: [
        'Soluciones empresariales con Google AppSheet.',
        'Auto-verificación de flujos de trabajo y recolección de datos.',
        'Identificación de oportunidades de mejora técnica continua.',
      ],
    ),
    _Experience(
      period: '07/2023 – 06/2024',
      role: 'QA Analyst',
      subtitle: 'Alaxatech · Remoto',
      bullets: [
        'Gestión de planes de prueba end-to-end en Trello.',
        'Documentación funcional y especificación de casos de prueba.',
        'Ejecución de pruebas de regresión, integración y UI/UX.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      padding: EdgeInsets.fromLTRB(hPad(context), sectionGap(context), hPad(context), sectionGap(context)),
      color: AppTheme.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: mobile ? 24 : 40),
          ..._experiences.asMap().entries.map((e) {
            return _ExperienceBlock(
              experience: e.value,
              isLast: e.key == _experiences.length - 1,
            );
          }),
        ],
      ),
    );
  }
}

class _Experience {
  final String period;
  final String role;
  final String subtitle;
  final List<String> bullets;
  const _Experience({
    required this.period,
    required this.role,
    required this.subtitle,
    required this.bullets,
  });
}

class _ExperienceBlock extends StatelessWidget {
  final _Experience experience;
  final bool isLast;

  const _ExperienceBlock({required this.experience, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mobile) ...[
          Text(
            experience.period,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.darkBrown,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!mobile)
              SizedBox(
                width: 120,
                child: Text(
                  experience.period,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkBrown,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            if (!mobile) const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.role,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    experience.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.darkBrown,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...experience.bullets.map(
                    (b) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Container(
                                width: 6, height: 6, color: AppTheme.olive),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              b,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppTheme.darkBrown,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) const Divider(color: AppTheme.beige, height: 32),
      ],
    );
  }
}
