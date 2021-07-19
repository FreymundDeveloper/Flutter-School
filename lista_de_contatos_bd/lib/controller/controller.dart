import 'package:flutter/cupertino.dart';
import 'package:lista_de_contatos_bd/contatos_repository.dart';
import 'package:lista_de_contatos_bd/models/contato.dart';


class Controller {
  List<Contato> contatos = [];

  ContatosRepository repository = ContatosRepository();

  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> buscarBanco() async{
    return await repository.selectAll().then((value) {
      contatos = value;
    });
  }

  Future<void> cadastrar() async {
    Contato contato = Contato(nomeController.text, telefoneController.text, emailController.text);
    return await repository.insert(contato).then((value) {
      nomeController.clear();
      telefoneController.clear();
      emailController.clear();
    });
  }

  Future<void> remover(int index) async{
    await repository.delete(contatos[index]).whenComplete(() {
      contatos.removeAt(index);
    });
  }
}