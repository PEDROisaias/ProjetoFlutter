// ignore: file_names
import 'package:aurelia_app/data/model/Contato.dart';
import 'package:flutter/material.dart';

// O ViewModel gerencia a lógica de negócio e os dados para a View.
// Estende `ChangeNotifier` para notificar os widgets sobre mudanças.
class ContatosViewModel extends ChangeNotifier {
  // Lista privada de contatos. O `_` indica que é privada.
  List<Contato> _contatos = [];

  // Getter público para acessar a lista de contatos.
  List<Contato> get contatos => _contatos;

  // O construtor é chamado quando a classe é instanciada.
  ContatosViewModel() {
    // Carrega a lista de contatos ao criar a instância do ViewModel.
    carregarContatos();
  }
  // Método para carregar a lista de contatos (simulando uma API ou banco de dados).
  void carregarContatos() {
    // Popula a lista `_contatos` com dados de exemplo.
    _contatos = [
      Contato(nome: 'Bruno', relacao: 'Filho', telefone: '(21) 19999-9999'),
      Contato(nome: 'Aurélia', relacao: 'Esposa', telefone: '(19) 99029-8888'),
      Contato(nome: 'Cintia', relacao: 'Filha', telefone: '(10) 99999-9999'),
      Contato(nome: 'Paulane', relacao: 'Neta', telefone: '(11) 88888-8888'),
      Contato(nome: 'Carla', relacao: 'Filha', telefone: '(12) 77777-7777'),
      Contato(nome: 'Carlos', relacao: 'Filho', telefone: '(13) 66666-6666'),
      Contato(nome: 'Jorge', relacao: 'Neto', telefone: '(14) 55555-5555'),
      Contato(nome: 'Vitor', relacao: 'Neto', telefone: '(15) 44444-4444'),
      Contato(nome: 'Thiago', relacao: 'Neto', telefone: '(16) 33333-3333'),
      Contato(nome: 'Rodrigo', relacao: 'Neto', telefone: '(17) 22222-2222'),
      Contato(nome: 'Lucas', relacao: 'Filho', telefone: '(18) 11111-1111'),
      Contato(nome: 'Pedro', relacao: 'Filho', telefone: '(19) 98989-8989'),
      Contato(nome: 'Roger', relacao: 'Amante', telefone: '(20) 87878-7878'),
    ];
    // Chama `notifyListeners()` para notificar todos os widgets que estão
    // usando este ViewModel que os dados foram atualizados,
    // o que acionará uma reconstrução da UI.
    notifyListeners();
  }
}
