import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          Text(
            'Servicios Especializados',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Soluciones integrales para llevar tu idea al siguiente nivel',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 800 ? 3 : 1;
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
                children: const [
                  _ServiceCard(
                    icon: Icons.phone_android,
                    title: 'Mobile App Development',
                    description:
                        'Apps nativas y PWA con Flutter, integración de '
                        'backend con Supabase/Firebase, autenticación, '
                        'y despliegue en Play Store y web.',
                  ),
                  _ServiceCard(
                    icon: Icons.bug_report,
                    title: 'QA & Testing',
                    description:
                        'Diseño y ejecución de casos de prueba funcionales, '
                        'regresión, integración y UI/UX. Control de calidad '
                        'end-to-end con reportes en Trello.',
                  ),
                  _ServiceCard(
                    icon: Icons.auto_awesome,
                    title: 'AI-Assisted Prototyping',
                    description:
                        'Prototipado rápido asistido por IA Generativa. '
                        'De la idea a MVP funcional en tiempo récord '
                        'con código limpio y escalable.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 36, color: AppTheme.primary),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
