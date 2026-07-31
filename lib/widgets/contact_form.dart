import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme/app_theme.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  bool _sending = false;
  bool _sent = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);
    try {
      await http.post(
        Uri.parse('https://formspree.io/f/xvzenarj'),
        headers: {'Accept': 'application/json'},
        body: {
          'name': _nameCtrl.text,
          'email': _emailCtrl.text,
          'message': _msgCtrl.text,
        },
      );
      setState(() => _sent = true);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al enviar. Intenta de nuevo.')),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    if (_sent) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Text(
          'Mensaje enviado. Gracias.',
          style: TextStyle(color: AppTheme.olive, fontSize: 16),
        ),
      );
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildField(_nameCtrl, 'Nombre', false),
            SizedBox(height: mobile ? 12 : 16),
            _buildField(_emailCtrl, 'Email', false,
                keyboard: TextInputType.emailAddress),
            SizedBox(height: mobile ? 12 : 16),
            _buildField(_msgCtrl, 'Mensaje', true),
            SizedBox(height: mobile ? 20 : 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _sending ? null : _submit,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.white,
                  side: const BorderSide(color: AppTheme.white, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: const RoundedRectangleBorder(),
                ),
                child: Text(
                  _sending ? 'ENVIANDO...' : 'ENVIAR',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController ctrl, String label, bool multi,
      {TextInputType? keyboard}) {
    return TextFormField(
      controller: ctrl,
      maxLines: multi ? 4 : 1,
      keyboardType: keyboard,
      validator: (v) =>
          v == null || v.trim().isEmpty ? 'Campo requerido' : null,
      style: const TextStyle(color: AppTheme.white, fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppTheme.beige, fontSize: 12),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.darkBrown),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.beige),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.olive),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.olive),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
