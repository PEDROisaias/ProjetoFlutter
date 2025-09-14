import 'package:aurelia_app/data/model/Contato.dart';
import 'package:aurelia_app/ui/view_model/contatos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// O widget principal que constrói a nossa tela.
class TelaContatos extends StatefulWidget {
  const TelaContatos({super.key});

  @override
  State<TelaContatos> createState() {
    return TelaContatosState();
  }
}

class TelaContatosState extends State<TelaContatos> {
  @override
  Widget build(BuildContext context) {
    // Acessa a instância da ViewModel
    final viewModel = Provider.of<ContatosViewModel>(context);

    // Scaffold é a estrutura padrão da tela que ja vem com alguns widgets
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),

      // Define que o corpo da tela será uma coluna vertical para o cabeçalho e a lista.
      body: Column(
        children: [
          _buildHeader(), // Puxando o cabeçalho criado
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: viewModel.contatos.length,
              itemBuilder: (context, index) {
                // Pega o contato especifico da lista referente ao item da lista
                final contato = viewModel.contatos[index];
                return _buildContactItem(contato);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF49C2B2),
        child: const Icon(Icons.psychology, color: Colors.white),
      ),
    );
  }

  // Widget para construir o cabeçalho verde.
  Widget _buildHeader() {
    return Container(
      // Construção do cabeçalho
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
          Icon(Icons.add, color: Colors.white, size: 32),
        ],
      ),
    );
  }

  // Widget para construir um único item da lista.
  Widget _buildContactItem(Contato contato) {
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
            child: contato.urlImage != null
                ? Image.network(
                    contato.urlImage!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
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
          const SizedBox(width: 15),
          // Coluna com Nome e Parentesco
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contato.nome,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                contato.relacao,
                style: const TextStyle(fontSize: 14, color: Colors.blueAccent),
              ),
            ],
          ),
          // Spacer ocupa todo o espaço restante para empurrar o botão para a direita.
          const Spacer(),
          // Botão de Ligar
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, color: Color(0xFF388E3C), size: 18),
            label: const Text(
              'Ligar',
              style: TextStyle(color: Color(0xFF388E3C)),
            ),
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
