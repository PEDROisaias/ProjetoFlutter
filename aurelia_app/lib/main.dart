// Importa o pacote principal do Flutter para usar os widgets do Material Design.
import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:aurelia_app/ui/view/tela_home.dart';
import 'package:aurelia_app/ui/view/tela_contatos.dart';
import 'package:aurelia_app/ui/view/tela_lembretes.dart';
// Importa os ViewModels para gerenciar o estado da aplicação.
import 'package:aurelia_app/ui/view_model/auth_view_model.dart';
import 'package:aurelia_app/ui/view_model/contatos_view_model.dart';
// Importa as telas de autenticacçãp
import 'package:aurelia_app/ui/view/tela_login.dart';
import 'package:aurelia_app/ui/view/tela_cadastro.dart';
import 'package:aurelia_app/ui/view/tela_splash.dart';
import 'package:aurelia_app/ui/view/tela_welcome.dart';
// 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// A função main() é o ponto de entrada da aplicação. 
void main() {
  // Inicia o app executando o widget raiz 'MeuApp'.
  runApp(const MeuApp());
} 

// MeuApp é o widget raiz da aplicação, definido como um StatelessWidget pois não tem estado mutável. 
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        // Adiciona os ViewModels como providers para gerenciar o estado da aplicação.
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ContatosViewModel()),

      ],
      child: MaterialApp(
        title: 'Aurélia',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,

        initialRoute: '/splash',

        routes: {
          '/splash': (context) => const TelaSplash(),
          '/welcome': (context) => const TelaWelcome(),
          '/login': (context) => const TelaLogin(),
          '/cadastro': (context) => const TelaCadastro(),
          '/home': (context) => const TelaHome(),
          '/contatos': (context) => const TelaContatos(),
          '/lembretes': (context) => const TelaLembretes(),
        },
      ),
    );
  }
}

