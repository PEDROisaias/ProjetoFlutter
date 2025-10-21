import 'package:flutter/material.dart';
import 'package:aurelia_app/ui/core/app_theme.dart';

class TelaWelcome extends StatelessWidget {
  const TelaWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'AURÉLIA',
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(fontSize: 22),
              ),
              const Spacer(flex: 1),
              Image.asset('assets/images/image_welcome.png', height: 250),
              const SizedBox(height: 32),
              Text(
                'Sejam bem-vindos ao AURÉLIA!',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Que bom ter você aqui. A Aurélia é o seu novo aliado de confiança, criado com muito carinho para melhorar sua qualidade de vida e promover sua autonomia.Desenvolvido para você e para o seu cuidador!',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.restorablePushReplacementNamed(context, '/login');
        },
        backgroundColor: AppTheme.primaryColor,
        elevation: 2.0,
        child: const Icon(Icons.arrow_forward, color: AppTheme.lightColor),
      ),
    );
  }
}
