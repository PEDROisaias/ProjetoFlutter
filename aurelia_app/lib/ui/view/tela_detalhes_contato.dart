import 'package:aurelia_app/data/model/contato.dart';
import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:aurelia_app/ui/view/tela_contatos.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        // O corpo da tela é uma coluna que organiza os widgets verticalmente.
        // Toda essa parte é da foto do contato
        body: Column(
          // Centraliza os widgets horizontalmente.
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(context),
            // Chama o método para construir o widget que exibe a foto do contato.
            _buildFotoContato(),
            // Adiciona um espaço vertical de 20 pixels.
            const SizedBox(height: 25),
            // O Expanded faz com que o widget de informações ocupe todo o
            // espaço vertical restante.
            Expanded(child: _buildInfoContato()),
            const SizedBox(height: 25),

            // Linha com dois botões: "Ligar" e "Reportar".
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 26,
                  ),
                  label: const Text(
                    'Ligar',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(81, 230, 144, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0, // Sem sombra
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icone_emergencia.png',
                    width: 26,
                    height: 26,
                  ),
                  label: const Text(
                    'Emergência',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 80, 80, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    elevation: 0, // Sem sombra
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25), // Espaçamento inferior
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------------------------------------

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

  // -------------------------------------------------------------------------------------------------------

  // Constrói a seção da foto do contato.
  Widget _buildFotoContato() {
    return Container(
      // Adiciona uma margem superior para espaçamento.
      margin: EdgeInsets.only(top: 30),
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

      // Exibe a imagem do contato ou um ícone padrão se a imagem não estiver disponível.
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

  // -------------------------------------------------------------------------------------------------------

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
          color: AppTheme.primaryColor,
          width: 3,
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
              color: AppTheme.primaryColor,
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

  // -----------------------------------------------------------------------------------------------

  Widget _buildHeader(BuildContext context) {
    // Adiciona preenchimento interno
    return Container(
      // Construção do cabeçalho. Define a cor de fundo e o raio dos cantos inferiores.
      padding: const EdgeInsets.only(top: 15, bottom: 20, left: 10),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Botão de voltar
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => TelaContatos()),
              );
            },
          ),
          // Título do cabeçalho
          const SizedBox(width: 8),
          const Text(
            'Detalhes do Contato',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }
}
