// ignore: file_names
import 'package:aurelia_app/data/model/Contato.dart';
import 'package:aurelia_app/ui/view/TelaDetalhesContato.dart';
import 'package:aurelia_app/ui/view_model/ContatosViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// O widget principal que constrói a nossa tela.
// É um StatefulWidget porque seu estado pode mudar (embora a lógica de dados
// seja gerenciada pelo ViewModel).
class TelaContatos extends StatefulWidget {
  const TelaContatos({super.key});

  @override
  State<TelaContatos> createState() {
    // Cria o estado para este widget.
    return TelaContatosState();
  }
}

class TelaContatosState extends State<TelaContatos> {
  @override
  Widget build(BuildContext context) {
    // Acessa a instância da ViewModel usando Provider.of.
    // O `listen: true` (padrão) garante que este widget será reconstruído
    // sempre que o notifyListeners() for chamado no ViewModel.
    final viewModel = Provider.of<ContatosViewModel>(context);

    // Scaffold é a estrutura padrão da tela que já vem com alguns widgets
    // básicos como AppBar, FloatingActionButton, etc.
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5), // Cor de fundo da tela.

      // Define que o corpo da tela será uma coluna vertical.
      body: Column(
        children: [
          _buildHeader(), // Chama o método para construir o cabeçalho.
          // O Expanded faz com que o ListView ocupe todo o espaço restante
          // na coluna, abaixo do cabeçalho.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              // O `itemCount` define quantos itens a lista terá,
              // baseado no tamanho da lista de contatos do ViewModel.
              itemCount: viewModel.contatos.length,
              itemBuilder: (context, index) {
                // Pega o contato especifico da lista referente ao item da lista
                final contato = viewModel.contatos[index];
                 // Retorna o widget para exibir um item da lista.
                return _buildContactItem(contato);
              },
            ),
          ),
        ],
      ),
      // Botão flutuante na parte inferior direita.
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Ação vazia(mas obrigatória).
        backgroundColor: const Color(0xFF49C2B2),
        child: const Icon(Icons.psychology, color: Colors.white),
      ),
    );
  }

  // Widget para construir o cabeçalho.
  Widget _buildHeader() {
    // Adiciona preenchimento interno
    return Container(
      // Construção do cabeçalho. Define a cor de fundo e o raio dos cantos inferiores.
      padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF49C2B2), 
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        // Alinha os elementos do cabeçalho nas extremidades.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          // Texto do título.
          Text(
            'Contatos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Ícone de adicionar contato.
          Icon(Icons.add, color: Colors.white, size: 32),
        ],
      ),
    );
  }

  // Widget para construir um único item da lista.
  Widget _buildContactItem(Contato contato) {
    // `InkWell` torna o contêiner clicável e adiciona um efeito visual.
    return InkWell(
      onTap: () {
        // Navega para a tela de detalhes quando o item é clicado,
        // passando o objeto `contato` como argumento.
        Navigator.push(context, MaterialPageRoute(builder: (context) => Teladetalhescontato(contato: contato)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
           // Adiciona uma sombra para dar um efeito de elevação.
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
            const SizedBox(width: 15),
            // Coluna com Nome e Relação
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
              onPressed: () {}, // Ação vazia
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
      ),
    );
  }
}
