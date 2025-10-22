import 'package:flutter/material.dart';

class AuthLogoHeader extends StatelessWidget {
  const AuthLogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/aurelia_logo_auth.png'),
        const SizedBox(height: 16),
        // Text('AURÉLIA', style: Theme.of(context).textTheme.headlineLarge
        // ),
      ],
    );
  }
}
