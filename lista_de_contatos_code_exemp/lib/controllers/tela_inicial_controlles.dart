import 'package:flutter/cupertino.dart';
import 'package:lista_de_contatos_code_exemp/models/contato.dart';

class TelaInicialController {
  TextEditingController caixaNome = TextEditingController();
  TextEditingController caixaTelefone = TextEditingController();

  List<Contato> _contatos = [
    Contato(nome: 'Fulano', telefone: '111111'),
    Contato(nome: 'Ciclano', telefone: '22222'),
    Contato(nome: 'Beltrano', telefone: '33333'),
  ];

  List<Contato> get contatos => _contatos;

  void adicionarContato() {
    Contato contato = Contato();
    contato.nome = caixaNome.text;
    contato.telefone = caixaTelefone.text;
    _contatos.add(contato);
    caixaNome.clear();
    caixaTelefone.clear();
  }

  void removerContato(int posicao) {
    _contatos.removeAt(posicao);
  }
}