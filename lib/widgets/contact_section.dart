import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const _links = [
    _Social(
      label: 'LinkedIn',
      handle: 'linkedin.com/in/acostheta',
      url: 'https://linkedin.com/in/acostheta',
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#BDB495"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/><rect x="2" y="9" width="4" height="12"/><circle cx="4" cy="4" r="2"/></svg>',
    ),
    _Social(
      label: 'X',
      handle: 'x.com/acostheta',
      url: 'https://x.com/acostheta',
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#BDB495"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>',
    ),
    _Social(
      label: 'Instagram',
      handle: 'instagram.com/acostheta',
      url: 'https://instagram.com/acostheta',
      svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#BDB495" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"/></svg>',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
          hPad(context), sectionGap(context), hPad(context), sectionGap(context)),
      color: AppTheme.nearBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contacto',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: AppTheme.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mobile ? 32 : 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              children: _links
                  .asMap()
                  .entries
                  .map((e) => _ContactRow(
                        social: e.value,
                        isLast: e.key == _links.length - 1,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 32),
          const ContactForm(),
          const SizedBox(height: 48),
          const Divider(color: AppTheme.darkBrown),
          const SizedBox(height: 24),
          Text(
            '© 2026 Luis Acosta',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.beige.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _Social {
  final String label;
  final String handle;
  final String url;
  final String svg;
  const _Social({
    required this.label,
    required this.handle,
    required this.url,
    required this.svg,
  });
}

class _ContactRow extends StatelessWidget {
  final _Social social;
  final bool isLast;

  const _ContactRow({required this.social, required this.isLast});

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
                    color: AppTheme.beige.withOpacity(0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : mobile ? 24 : 32),
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse(social.url)),
                child: Row(
                  children: [
                    Image.network(
                      'data:image/svg+xml;base64,${base64Encode(utf8.encode(social.svg))}',
                      width: 24,
                      height: 24,
                      errorBuilder: (_, __, ___) => const Icon(
                          Icons.link,
                          size: 24,
                          color: AppTheme.beige),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          social.label.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.beige,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          social.handle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
