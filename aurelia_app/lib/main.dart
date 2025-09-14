// Importa o pacote principal do Flutter para usar os widgets do Material Design.
import 'package:flutter/material.dart';

// A função main()
void main() {
  runApp(const MeuApp());
}

// MeuApp é o widget raiz da aplicação
class MeuApp extends StatelessWidget {
  const MeuApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Desativa o banner de "Debug" no canto superior direito.
      debugShowCheckedModeBanner: false,
      // A tela inicial do nosso app será a TelaContatos.
      home: TelaContatos(),
    );
  }
}

// O widget principal que constrói a nossa tela.
class TelaContatos extends StatelessWidget {
  const TelaContatos({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold é a estrutura base da tela, com fundo, app bar, etc.
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5), // Cor de fundo cinza claro
      // O corpo da nossa tela será uma coluna vertical para o cabeçalho e a lista.
      body: Column(
        children: [
          _buildHeader(), // Nosso cabeçalho customizado
          _buildContactList(), // A lista de contatos
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação para o botão flutuante
        },
        backgroundColor: const Color(0xFF49C2B2),
        child: const Icon(Icons.psychology, color: Colors.white), // Ícone de cérebro (aproximação)
      ),
    );
  }

  // Widget para construir o cabeçalho verde.
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF49C2B2), // Cor verde-água do cabeçalho
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Contatos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ],
      ),
    );
  }

  // Widget para construir a lista de contatos.
  Widget _buildContactList() {
    // Expanded garante que a lista ocupe todo o espaço restante na tela.
    return Expanded(
      // ListView.builder é otimizado para listas longas.
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // *** CORREÇÃO APLICADA AQUI ***
          // As URLs das imagens foram corrigidas para o formato correto.
          _buildContactItem(
              name: 'Bruno',
              relationship: 'Filho',
              imageUrl: '[https://placehold.co/100x100/EFEFEF/333?text=B](https://placehold.co/100x100/EFEFEF/333?text=B)'),
          _buildContactItem(
              name: 'Aurélia',
              relationship: 'Esposa',
              imageUrl: '[https://placehold.co/100x100/EFEFEF/333?text=A](https://placehold.co/100x100/EFEFEF/333?text=A)'),
          _buildContactItem(name: 'Nome', relationship: 'Filho'),
          _buildContactItem(name: 'Nome', relationship: 'Filho'),
          _buildContactItem(name: 'Nome', relationship: 'Filho'),
          _buildContactItem(name: 'Nome', relationship: 'Filho'),
          _buildContactItem(name: 'Nome', relationship: 'Filho'),
        ],
      ),
    );
  }

  // Widget para construir um único item da lista.
  Widget _buildContactItem(
      {required String name, required String relationship, String? imageUrl}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar (imagem ou ícone)
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 60,
                    height: 60,
                    color: const Color(0xFF49C2B2),
                    child: const Icon(Icons.person, color: Colors.white, size: 40),
                  ),
          ),
          const SizedBox(width: 15),
          // Coluna com Nome e Parentesco
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                relationship,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          // Spacer ocupa todo o espaço restante para empurrar o botão para a direita.
          const Spacer(),
          // Botão de Ligar
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, color: Color(0xFF388E3C), size: 18),
            label: const Text('Ligar', style: TextStyle(color: Color(0xFF388E3C))),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC8E6C9), // Fundo verde claro
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0, // Sem sombra
            ),
          ),
        ],
      ),
    );
  }
}
