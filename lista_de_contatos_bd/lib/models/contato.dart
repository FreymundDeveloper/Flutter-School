class Contato {
  int? id;
  String? nome;
  String? telefone;
  String? email;

  Contato(this.nome, this.telefone, this.email);

  Contato.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.telefone = json['telefone'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'telefone': this.telefone,
      'email': this.email, 
    };
  }

  @override
  String toString() {
    return '$id - $nome - $telefone - $email';
  }
}