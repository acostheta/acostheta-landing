import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    _Service(
      number: '01',
      title: 'Mobile App\nDevelopment',
      desc:
          'Apps nativas y PWA con Flutter, integración de backend con Supabase o Firebase, autenticación, y despliegue en Play Store y web.',
    ),
    _Service(
      number: '02',
      title: 'QA &\nTesting',
      desc:
          'Diseño y ejecución de casos de prueba funcionales, regresión, integración y UI/UX. Control de calidad end-to-end con reportes.',
    ),
    _Service(
      number: '03',
      title: 'AI-Assisted\nPrototyping',
      desc:
          'Prototipado rápido asistido por IA Generativa. De la idea a MVP funcional en tiempo récord con código limpio y escalable.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 80, 32, 80),
      color: AppTheme.cream,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          ..._services.map((s) => _ServiceRow(service: s)),
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

class _ServiceRow extends StatelessWidget {
  final _Service service;
  const _ServiceRow({required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 48,
                child: Text(
                  service.number,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.beige,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            ],
          ),
          const Divider(color: AppTheme.beige, height: 32),
        ],
      ),
    );
  }
}
