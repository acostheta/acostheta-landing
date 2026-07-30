import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    _Service(
      number: '01',
      title: 'Desarrollo Mobile',
      desc:
          'Apps Android, iOS y PWA con Flutter + Dart. Backend con Supabase o '
          'Firebase, autenticación y publicación en tiendas.',
    ),
    _Service(
      number: '02',
      title: 'QA y Testing',
      desc:
          'Casos de prueba funcionales, regresión, integración y UI/UX. '
          'Control de calidad end-to-end con reportes en Trello.',
    ),
    _Service(
      number: '03',
      title: 'Gestión de Proyectos',
      desc:
          'Planificación ágil, coordinación de equipos remotos y comunicación '
          'estructurada para entregas predecibles y sin fricción.',
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
            'Servicios',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mobile ? 32 : 48),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 32,
                alignment: WrapAlignment.center,
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          service.desc,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(color: AppTheme.beige, height: 32),
      ],
    );
  }
}
