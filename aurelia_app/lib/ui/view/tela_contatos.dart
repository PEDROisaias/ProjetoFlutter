// ignore: file_names
import 'package:aurelia_app/data/model/contato.dart';
import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:aurelia_app/ui/view/tela_detalhes_contato.dart';
import 'package:aurelia_app/ui/view/tela_home.dart';
import 'package:aurelia_app/ui/view_model/contatos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    final viewModel = Provider.of<ContatosViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightColor,
      
        body: Column(
          children: [
            buildHeader(), 
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {}, 
          backgroundColor: AppTheme.primaryColor,
          child: Image.asset('assets/images/aurelia_logo_bg_transparent.png'),
        ),
      ),
    );
  }

  // -----------------------------------------------------------------------------------------------------------------

  // Widget para construir o cabeçalho.
  Widget buildHeader() {
    return Container(
      // Construção do cabeçalho. Define a cor de fundo e o raio dos cantos inferiores.
      padding: const EdgeInsets.only(top: 25, bottom: 20, left: 10, right: 20),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        // Alinha os elementos do cabeçalho nas extremidades.
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.lightColor, size: 28),
            onPressed: () {
              Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const TelaHome())
              ); // Volta para a tela anterior ao pressionar o botão.
            },
          ),
          const SizedBox(width: 20),
          // Texto do título.
          Text(
            'Contatos',
            style: TextStyle(
              color: AppTheme.lightTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            ),
          ),
          const Spacer(),
          // Ícone de adicionar contato.
          Icon(Icons.add, 
          color: AppTheme.lightColor, 
          size: 32,
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------------------------------------------------

  // Widget para construir um único item da lista.
  Widget _buildContactItem(Contato contato) {
    return InkWell(
      onTap: () {
        // Navega para a tela de detalhes quando o item é clicado,
        // passando o objeto `contato` como argumento.
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDetalhesContato(contato: contato)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.lightColor,
          borderRadius: BorderRadius.circular(20),
           // Adiciona uma sombra para dar um efeito de elevação.
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppTheme.lightGrayColor,
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
                      color: AppTheme.primaryColor,
                      child: const Icon(
                        Icons.person,
                        color: AppTheme.lightColor,
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
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  contato.relacao,
                  style: const TextStyle(
                    fontSize: 18, 
                    color: AppTheme.primaryColor,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500,
                    ),
                ),
              ],
            ),
            // Spacer ocupa todo o espaço restante para empurrar o botão para a direita.
            const Spacer(),
            // Botão de Ligar
            ElevatedButton.icon(
              onPressed: () {}, // Ação vazia
              icon: const Icon(Icons.phone, color: AppTheme.lightColor, 
              size: 22,
              ),
              label: const Text(
                'Ligar',
                style: TextStyle(color: AppTheme.lightTextColor,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                backgroundColor: const Color.fromRGBO(81, 230, 144, 1.0), // Fundo verde claro
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
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
