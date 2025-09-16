// ignore: file_names
import 'package:aurelia_app/data/model/Contato.dart';
import 'package:flutter/material.dart';

// Este widget não tem estado mutável, então é um StatelessWidget.
class Teladetalhescontato extends StatelessWidget {
  // A propriedade `contato` é obrigatória para a construção deste widget.
  final Contato contato;

  const Teladetalhescontato({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar é a barra de título na parte superior da tela.
      appBar: AppBar(
        title: Text('Contato'),
        backgroundColor: const Color(0xFF49C2B2),
      ),
      body: Row(
         // Centraliza os widgets horizontalmente.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: const Color.fromARGB(255, 73, 6, 6).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: contato.urlImage != null
              // Se a URL da imagem não for nula, carrega a imagem da internet.
                  ? Image.network(
                      contato.urlImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                    // Caso contrário, exibe um contêiner com um ícone de pessoa.
                  : Container(
                      width: 60,
                      height: 60,
                      color: const Color(0xFF49C2B2),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
