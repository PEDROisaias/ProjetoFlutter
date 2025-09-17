import 'package:aurelia_app/data/model/Contato.dart';
import 'package:flutter/material.dart';

// Este widget não tem estado mutável, então é um StatelessWidget.
class Teladetalhescontato extends StatelessWidget {
  // A propriedade `contato` é obrigatória, garantindo que a tela sempre
  // receba um objeto Contato para exibir.
  final Contato contato;

  const Teladetalhescontato({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    // Scaffold fornece a estrutura visual básica da tela.
    return Scaffold(
      // AppBar é a barra de título na parte superior da tela.
      appBar: AppBar(
        title: Text('Contato'),
         // Define a fonte, tamanho e peso do texto do título.
        titleTextStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        // Define a cor da barra de título.
        backgroundColor: const Color(0xFF49C2B2),
      ),

       // O corpo da tela é uma coluna que organiza os widgets verticalmente.
      // Toda essa parte é da foto do contato
      body: Column(
        // Centraliza os widgets horizontalmente.
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Chama o método para construir o widget que exibe a foto do contato.
          _buildFotoContato(),
          // Adiciona um espaço vertical de 20 pixels.
          const SizedBox(height: 20),
          // O Expanded faz com que o widget de informações ocupe todo o
          // espaço vertical restante.
          Expanded(child: _buildInfoContato()),

          // _buildBtnLigacao(),
        ],
      ),
    );
  }

// Widget utilitário para criar um campo de informação formatado.
  Widget _buildInfoField(String text) {
    return Container(
      // Adiciona preenchimento horizontal e vertical.
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // Adiciona uma cor de fundo cinza e bordas arredondadas.
      decoration: BoxDecoration(
        color: Colors.grey[200], // Cor de fundo cinza
        borderRadius: BorderRadius.circular(10),
      ),
      // Exibe o texto com um estilo de fonte específico.
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

// Constrói a seção da foto do contato.
  Widget _buildFotoContato() {
    return Container(
       // Adiciona uma margem superior para espaçamento.
      margin: EdgeInsets.only(top: 40),
      // Adiciona preenchimento interno.
      padding: const EdgeInsets.all(8),
      // Adiciona cor de fundo, bordas arredondadas e uma sombra.
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
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              )
            // Caso contrário, exibe um contêiner com um ícone de pessoa.
            : Container(
                width: 170,
                height: 170,
                color: const Color(0xFF49C2B2),
                child: const Icon(Icons.person, color: Colors.white, size: 40),
              ),
      ),
    );
  }

// Constrói a seção de informações do contato.
  Widget _buildInfoContato() {
    return Container(
         // Adiciona preenchimento interno e margem horizontal.
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // Adiciona uma cor de fundo, bordas, bordas arredondadas e uma sombra.
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(245, 246, 250, 1.0),
          width: 2,
        ),
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
      child: Column(
        // Alinha os widgets da coluna ao início horizontalmente.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contato.nome,
            // Estiliza o texto do nome do contato.
            style: TextStyle(
              color: const Color.fromRGBO(64, 211, 182, 1.0),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          // Exibe o campo de telefone do contato.
          _buildInfoField(contato.telefone),
          const SizedBox(height: 15),
          // Exibe o campo de relação do contato.
          _buildInfoField(contato.relacao),
          // O Spacer ocupa o espaço restante, empurrando o ícone para baixo
          const Spacer(),
          // Alinha o ícone de edição para a direita.
          Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.edit, color: Color.fromRGBO(18, 18, 18, 0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildBtnLigacao() {
    return Row(
      children: [
        ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 16, backgroundColor: Color.fromRGBO(144, 238, 144, 1.0))), onPressed: () {  

        }, 
        child: const Icon(Icons.call), 
        ),
      ],
    );
  }
}