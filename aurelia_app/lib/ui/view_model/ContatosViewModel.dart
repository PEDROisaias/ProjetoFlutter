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
      Contato(nome: 'Aurélia', relacao: 'Esposa', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
      Contato(nome: 'Nome', relacao: 'Filho', telefone: ''),
    ];
    // Chama `notifyListeners()` para notificar todos os widgets que estão
    // usando este ViewModel que os dados foram atualizados,
    // o que acionará uma reconstrução da UI.
    notifyListeners();
  }
}
