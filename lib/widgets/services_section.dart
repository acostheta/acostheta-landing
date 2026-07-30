import 'dart:convert';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    _Service(
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#BDB495" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="2" width="14" height="20" rx="2" ry="2"/><line x1="12" y1="18" x2="12.01" y2="18"/></svg>',
      title: 'Desarrollo Mobile',
      desc:
          'Apps Android, iOS y PWA con Flutter + Dart. Backend con Supabase o '
          'Firebase, autenticación y publicación en tiendas.',
    ),
    _Service(
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#BDB495" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>',
      title: 'QA y Testing',
      desc:
          'Casos de prueba funcionales, regresión, integración y UI/UX. '
          'Control de calidad end-to-end con reportes en Trello.',
    ),
    _Service(
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#BDB495" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><rect x="8" y="2" width="8" height="4" rx="1" ry="1"/><line x1="8" y1="12" x2="16" y2="12"/><line x1="8" y1="16" x2="14" y2="16"/></svg>',
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
  final String svg;
  final String title;
  final String desc;
  const _Service({
    required this.svg,
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
        Image.network(
          'data:image/svg+xml;base64,${base64Encode(utf8.encode(service.svg))}',
          width: mobile ? 36 : 48,
          height: mobile ? 36 : 48,
          errorBuilder: (_, __, ___) => const SizedBox(
              width: 48, height: 48,
              child: Icon(Icons.code, color: AppTheme.beige)),
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
