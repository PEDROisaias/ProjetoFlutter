// Importa o pacote principal do Flutter para usar os widgets do Material Design.
import 'package:aurelia_app/ui/view_model/contatos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:aurelia_app/ui/view/tela_contatos_screen.dart';
import 'package:provider/provider.dart';

// A função main()
void main() {
  runApp(const MeuApp());
}

// MeuApp é o widget raiz da aplicação
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContatosViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TelaContatos(),
      ),
    );
  }
}
