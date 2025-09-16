// Classe model do Contato que representa a sua estrutura de dados
class Contato {
  final String nome;
  final String relacao;
  // A URL da imagem é opcional (`?` indica que pode ser nula).
  final String? urlImage; 

// Construtor da classe.
  Contato({required this.nome, required this.relacao, this.urlImage});
}

