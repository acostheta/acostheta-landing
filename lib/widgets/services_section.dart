import 'dart:convert';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    _Service(
      number: '01',
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#BDB495" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="2" width="14" height="20" rx="2" ry="2"/><line x1="12" y1="18" x2="12.01" y2="18"/></svg>',
      title: 'Desarrollo Mobile',
      desc:
          'Apps Android, iOS y PWA con Flutter + Dart. Backend con Supabase o '
          'Firebase, autenticación y publicación en tiendas.',
    ),
    _Service(
      number: '02',
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#BDB495" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>',
      title: 'QA y Testing',
      desc:
          'Casos de prueba funcionales, regresión, integración y UI/UX. '
          'Control de calidad end-to-end con reportes en Trello.',
    ),
    _Service(
      number: '03',
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
      color: AppTheme.cream,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Servicios',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mobile ? 32 : 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              children: _services
                  .asMap()
                  .entries
                  .map((e) => _ServiceRow(
                        service: e.value,
                        isLast: e.key == _services.length - 1,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Service {
  final String number;
  final String svg;
  final String title;
  final String desc;
  const _Service({
    required this.number,
    required this.svg,
    required this.title,
    required this.desc,
  });
}

class _ServiceRow extends StatelessWidget {
  final _Service service;
  final bool isLast;

  const _ServiceRow({required this.service, required this.isLast});

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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.beige.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          service.number,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.darkBrown,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Image.network(
                        'data:image/svg+xml;base64,${base64Encode(utf8.encode(service.svg))}',
                        width: 20,
                        height: 20,
                        errorBuilder: (_, __, ___) => const Icon(
                            Icons.code,
                            size: 20,
                            color: AppTheme.beige),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.desc,
                    style: Theme.of(context).textTheme.bodyMedium,
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
