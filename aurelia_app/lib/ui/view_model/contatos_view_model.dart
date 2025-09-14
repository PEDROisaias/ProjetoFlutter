import 'package:aurelia_app/data/model/Contato.dart';
import 'package:flutter/material.dart';

class ContatosViewModel extends ChangeNotifier{
  List<Contato> _contatos = [];


  List<Contato> get contatos => _contatos;


  ContatosViewModel() {
    carregarContatos();
  }

  void carregarContatos() {
    _contatos = [
      Contato(nome: 'Bruno', relacao: 'Filho', urlImage: ('assets/images/BrunoImg.png')),
      Contato(nome: 'Aurélia', relacao: 'Esposa', urlImage: ('')),
      Contato(nome: 'Nome', relacao: 'Filho'),
      Contato(nome: 'Nome', relacao: 'Filho'),
      Contato(nome: 'Nome', relacao: 'Filho'),
      Contato(nome: 'Nome', relacao: 'Filho'),
      Contato(nome: 'Nome', relacao: 'Filho'),
    ];
    notifyListeners();
  }
}