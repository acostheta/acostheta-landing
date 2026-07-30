import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _experiences = [
    _Experience(
      role: 'Flutter Developer (Mobile & AI-Assisted)',
      company: 'Progrese Asesoría · México (Remoto)',
      period: '12/2025 – 07/2026',
      bullets: [
        'Apps multiplataforma Android/Web con Flutter, Dart, Riverpod y Supabase.',
        'Orquestación de agentes IA (Gemini, DeepSeek, GLM) para co-creación de código.',
        'Auto-QA con casos de prueba detallados previo a releases.',
        'Despliegue de PWAs y builds para Google Play Store.',
      ],
    ),
    _Experience(
      role: 'Web & No-Code Developer',
      company: 'Progrese Asesoría · México (Remoto)',
      period: '10/2024 – 12/2025',
      bullets: [
        'Soluciones empresariales con Google AppSheet.',
        'Auto-verificación de flujos de trabajo y recolección de datos.',
        'Identificación de oportunidades de mejora técnica continua.',
      ],
    ),
    _Experience(
      role: 'QA Analyst',
      company: 'Alaxatech · Remoto',
      period: '07/2023 – 06/2024',
      bullets: [
        'Gestión de planes de prueba end-to-end en Trello.',
        'Documentación funcional y especificación de casos de prueba.',
        'Ejecución de pruebas de regresión, integración y UI/UX.',
      ],
    ),
    _Experience(
      role: 'Coordinator & Adult Volunteer',
      company: 'Asociación de Scouts de Venezuela',
      period: '11/2020 – Presente',
      bullets: [
        'Gestión de logística y control de calidad educativa.',
        'Seguimiento de planes de trabajo con principios ágiles.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      color: AppTheme.surface,
      child: Column(
        children: [
          Text(
            'Experiencia Profesional',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Trayectoria demostrable en desarrollo, QA y gestión',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _experiences.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return _ExperienceCard(
                  experience: _experiences[index],
                  isLast: index == _experiences.length - 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Experience {
  final String role;
  final String company;
  final String period;
  final List<String> bullets;
  const _Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.bullets,
  });
}

class _ExperienceCard extends StatelessWidget {
  final _Experience experience;
  final bool isLast;

  const _ExperienceCard({required this.experience, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 80,
                color: AppTheme.primary.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(experience.role,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.business, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(experience.company,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(experience.period,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...experience.bullets.map(
                    (b) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: TextStyle(color: AppTheme.primary)),
                          Expanded(child: Text(b, style: Theme.of(context).textTheme.bodyMedium)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
