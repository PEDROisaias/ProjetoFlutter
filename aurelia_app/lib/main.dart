// Importa o pacote principal do Flutter para usar os widgets do Material Design.
import 'package:aurelia_app/ui/view_model/ContatosViewModel.dart';
import 'package:flutter/material.dart';
import 'package:aurelia_app/ui/view/TelaContatos.dart';
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
    // Retorna um ChangeNotifierProvider que disponibiliza o ContatosViewModel
    // para toda a árvore de widgets abaixo. Isso permite que outros widgets
    // acessem e reajam a mudanças nos dados do ViewModel.
    return ChangeNotifierProvider(
      // A função `create` é chamada para criar uma instância do ViewModel.
      create: (context) => ContatosViewModel(),
      // O `child` do provider é o widget principal da aplicação.
      child: const MaterialApp(
        // Remove a faixa de "debug" no canto superior direito da tela.
        debugShowCheckedModeBanner: false,
        // Define a tela inicial da aplicação como a `TelaContatos`.
        home: TelaContatos(),
      ),
    );
  }
}
