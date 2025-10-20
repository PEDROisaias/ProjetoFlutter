import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:aurelia_app/ui/view/tela_home.dart';
import 'package:flutter/material.dart';

class TelaLembretes extends StatefulWidget {
  const TelaLembretes({super.key});

  @override
  State<TelaLembretes> createState() {
    return TelaLembretesState();
  }
}

class TelaLembretesState extends State<TelaLembretes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        body: Column(
          children: [
            buildHeader(),
            const SizedBox(height: 10),
            Text(
              'Veja suas tarefas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: 10, // Exemplo fixo de 10 lembretes
                itemBuilder: (context, index) {
                  return _buildReminderItem(index);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {}, // Ação vazia(mas obrigatória).
          backgroundColor: AppTheme.primaryColor,
          child: Image.asset('assets/images/aurelia_logo_bg_transparent.png'),
        ),
      ),
    );
  }

// -------------------------------------------------------------------------------------------------------

// Cabeçalho da tela com título e botão de navegação.
 Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 20, left: 50),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
                onPressed: () {
                  Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => TelaHome()),
                  );
                },
                 icon: const Icon(Icons.arrow_back, color: Colors.white, size: 26
                 ),
              ),
              const SizedBox(width: 20),
          Column(
            children: [
              const Text(
                'Olá, Usuário!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              const Text(
                'Como você está hoje?',
                style: TextStyle(
                  color: Colors.white,
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

// -------------------------------------------------------------------------------------------------------

// Widget para construir cada item de lembrete na lista.
  Widget _buildReminderItem(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: const Icon(Icons.circle, color: Color.fromARGB(255, 228, 227, 227), size: 35),
          onPressed: () {},  //Ao ser clicado muda o status do lembrete e fica verde
        ),
        title: Text('Lembrete ${index + 1}'),
        subtitle: const Text('Descrição do lembrete'),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {}, 
        ),
      ),
    );
  }
}