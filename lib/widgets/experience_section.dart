import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _experiences = [
    _Experience(
      period: '12/2025 – 07/2026',
      role: 'Desarrollador Flutter',
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
      role: 'Desarrollador Web y No-Code',
      subtitle: 'Progrese Asesoría · México (Remoto)',
      bullets: [
        'Soluciones empresariales con Google AppSheet.',
        'Auto-verificación de flujos de trabajo y recolección de datos.',
        'Identificación de oportunidades de mejora técnica continua.',
      ],
    ),
    _Experience(
      period: '07/2023 – 06/2024',
      role: 'Analista QA',
      subtitle: 'Alaxatech · Remoto',
      bullets: [
        'Lideré la garantía de calidad de software mediante la creación de Casos de Prueba, ejecución de pruebas funcionales y de regresión, y la gestión del ciclo de vida de bugs organizada en Trello, garantizando entregas estables y sin errores críticos.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
          hPad(context), sectionGap(context), hPad(context), sectionGap(context)),
      color: AppTheme.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experiencia',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mobile ? 32 : 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              children: _experiences
                  .asMap()
                  .entries
                  .map((e) => _ExperienceRow(
                        experience: e.value,
                        isLast: e.key == _experiences.length - 1,
                      ))
                  .toList(),
            ),
          ),
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

class _ExperienceRow extends StatelessWidget {
  final _Experience experience;
  final bool isLast;

  const _ExperienceRow({required this.experience, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppTheme.olive,
                  border: Border.all(color: AppTheme.olive, width: 3),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppTheme.beige.withOpacity(0.5),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : mobile ? 24 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.beige.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      experience.period,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkBrown,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Container(
                                width: 4, height: 4, color: AppTheme.olive),
                          ),
                          const SizedBox(width: 12),
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
          ),
        ],
      ),
    );
  }
}
