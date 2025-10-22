import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:aurelia_app/ui/view/tela_contatos.dart';
import 'package:aurelia_app/ui/view/tela_jogos.dart';
import 'package:aurelia_app/ui/view/tela_lembretes.dart';
import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() {
    return TelaHomeState();
  }
}

class TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildHeader(),
            // Espaçador para empurrar o conteúdo para baixo
            const SizedBox(height: 15),
            // Texto centralizado na tela
            Center(child: buildTarefasUrgentes()),
            const SizedBox(height: 5),
            Center(child: buildContainerButtons()),
            Divider(
              height: 25,
              color: AppTheme.primaryColor,
              thickness: 2.5,
              indent: 30,
              endIndent: 30,
            ),
            Text(
              'Conversar com Aurélia',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/aurelia_logo.png',
                width: 100,
                height: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------------------------------------------
  // Método para construir o cabeçalho da tela

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10, left: 100),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                'Olá, Usuário!',
                style: TextStyle(
                  color: AppTheme.lightTextColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              const Text(
                'Como você está hoje?',
                style: TextStyle(
                  color: AppTheme.lightTextColor,
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------------------------------------------------
  // Widget para construir o container de Tarefas Urgemtes

  Widget buildTarefasUrgentes() {
    return Container(
      width: 300,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.lightColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppTheme.lightGrayColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Text(
            'Tarefas de Hoje',
            style: TextStyle(
              fontSize: 20,
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 250,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 246, 250, 1.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 250,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 246, 250, 1.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------------------------------------------------

  // Widget para construir o container de botões
  Widget buildContainerButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Lembretes Button
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaLembretes()),
                    ),
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, right: 10),
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 169, 182, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm, size: 70, color: AppTheme.lightColor),
                        SizedBox(height: 10),
                        Text(
                          'Lembretes',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.lightTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // Contatos Button
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaContatos()),
                    ),
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(88, 219, 88, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, size: 70, color: AppTheme.lightColor),
                        SizedBox(height: 10),
                        Text(
                          'Contatos',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.lightTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Medicamentos Button
                InkWell(
                  onTap: () => {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, right: 10),
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(34, 192, 255, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/medicamento_icone.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Medicamentos',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.lightTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Games Button
            Column(
              children: [
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaJogos()),
                    ),
                    },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 165, 0, 1.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.games_rounded,
                          size: 70,
                          color: AppTheme.lightColor,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Jogos',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.lightTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
