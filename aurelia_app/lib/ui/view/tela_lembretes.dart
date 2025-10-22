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
  // número inicial de lembretes (pode vir de um backend/dados reais)
  final int _initialCount = 10;
  late List<bool> _completedTask;

  @override
  void initState() {
    super.initState();
    _completedTask = List<bool>.filled(_initialCount, false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightColor,
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
                itemCount: _completedTask.length, // usa o tamanho do estado
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

// Cabeçalho da tela com título, botão de navegação e botão de adicionar tarefa.
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 20, left: 10, right: 20),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => TelaHome()),
              );
            },
            icon: const Icon(Icons.arrow_back,
                color: AppTheme.lightColor, size: 28),
          ),
          const SizedBox(width: 12),
          // Título ocupa o espaço restante
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lembretes',
                  style: TextStyle(
                    color: AppTheme.lightTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ],
            ),
          ),

          // Botão de adicionar tarefa no final do header
          IconButton(
            onPressed: () {
              final TextEditingController taskController =
                  TextEditingController();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (ctx) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Adicionar tarefa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: taskController,
                          decoration: const InputDecoration(
                            labelText: 'Título',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Text(
                                'CANCELAR',
                                style: TextStyle(
                                  fontSize: 14
                                  ),
                                ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                final text = taskController.text.trim();
                                Navigator.pop(ctx);
                                if (text.isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Tarefa "$text" adicionada'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('SALVAR',
                              style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add, color: AppTheme.lightColor, size: 28),
          ),
        ],
      ),
    );
  }

// -------------------------------------------------------------------------------------------------------

// Widget para construir cada item de lembrete na lista.
  Widget _buildReminderItem(int index) {
    final completedTask = _completedTask[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: completedTask
              ? Icon(Icons.check_circle, color: Colors.green, size: 35)
              : const Icon(Icons.circle,
                  color: Color.fromARGB(255, 228, 227, 227), size: 35),
          onPressed: () {
            setState(() {
              _completedTask[index] = !completedTask;
            });
          },
        ),
        title: Text(
          'Lembrete ${index + 1}',
          style: completedTask
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        subtitle: const Text('Descrição do lembrete'),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {},
        ),
      ),
    );
  }
}