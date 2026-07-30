import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    _Service(
      number: '01',
      title: 'Mobile\nDevelopment',
      desc:
          'Apps nativas y PWA con Flutter + Dart. Integración de backend con '
          'Supabase o Firebase, autenticación, y despliegue en Play Store y web. '
          'Prototipado acelerado con IA generativa.',
    ),
    _Service(
      number: '02',
      title: 'QA &\nTesting',
      desc:
          'Diseño y ejecución de casos de prueba funcionales, regresión, '
          'integración y UI/UX. Control de calidad end-to-end con reportes '
          'estructurados en Trello y documentación de criterios de aceptación.',
    ),
    _Service(
      number: '03',
      title: 'Project\nManagement',
      desc:
          'Planificación y seguimiento de proyectos con metodologías ágiles. '
          'Gestión de hitos, coordinación de equipos remotos, y comunicación '
          'estructurada para entregas predecibles y sin fricción.',
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
            'Services',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Lo que puedo hacer por tu proyecto',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: mobile ? 24 : 40),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: _services.map((s) {
                  final cardWidth = mobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 48) / 3;
                  return SizedBox(
                    width: cardWidth,
                    child: _ServiceCard(service: s),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Service {
  final String number;
  final String title;
  final String desc;
  const _Service({
    required this.number,
    required this.title,
    required this.desc,
  });
}

class _ServiceCard extends StatelessWidget {
  final _Service service;
  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.number,
          style: TextStyle(
            fontSize: mobile ? 36 : 48,
            fontWeight: FontWeight.w700,
            color: AppTheme.beige,
            height: 1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          service.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Text(
          service.desc,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Divider(color: AppTheme.beige, height: 32),
      ],
    );
  }
}
