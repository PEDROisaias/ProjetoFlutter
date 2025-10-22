import 'package:aurelia_app/ui/core/app_theme.dart';
import 'package:aurelia_app/ui/widgets/sub_header.dart';
import 'package:flutter/material.dart';

class Game {
  final String title;
  final String subtitle;
  final IconData icon;
  const Game({required this.title, required this.subtitle, required this.icon});
}

class TelaJogos extends StatefulWidget {
  const TelaJogos({super.key});

  @override
  State<TelaJogos> createState() {
    return TelaJogosState();
  }
}

class TelaJogosState extends State<TelaJogos> {
  final List<Game> _games = const [
    Game(
      title: 'Memória',
      subtitle: 'Exercite sua memória com pares de cartas.',
      icon: Icons.memory,
    ),
    Game(
      title: 'Quebra-cabeça',
      subtitle: 'Monte a imagem no menor tempo possível.',
      icon: Icons.extension,
    ),
    Game(
      title: 'Labirinto',
      subtitle: 'Encontre a saída do labirinto.',
      icon: Icons.map,
    ),
    Game(
      title: 'Ligue os Pontos',
      subtitle: 'Coordenação motora e raciocínio.',
      icon: Icons.connect_without_contact,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightColor,
        body: Column(
          children: [
            const SubHeader(title: 'Jogos'),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: _games.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final game = _games[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      leading: CircleAvatar(
                        // aumentei o raio e o tamanho do ícone aqui
                        radius: 30,
                        // ignore: deprecated_member_use
                        backgroundColor: AppTheme.primaryColor.withOpacity(
                          0.12,
                        ),
                        child: Icon(
                          game.icon,
                          color: AppTheme.primaryColor,
                          size: 28,
                        ),
                      ),
                      title: Text(
                        game.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(game.subtitle),
                      trailing: IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Abrir "${game.title}"')),
                          );
                          // Exemplo: Navigator.pushNamed(context, '/jogo_memoria');
                        },
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Abrir "${game.title}"')),
                        );
                      },
                    ),
                  );
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
}
