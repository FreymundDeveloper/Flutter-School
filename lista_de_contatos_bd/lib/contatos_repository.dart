import 'package:lista_de_contatos_bd/banco_de_dados.dart';
import 'package:lista_de_contatos_bd/models/contato.dart';


class ContatosRepository {
  Future<List<Contato>> selectAll() async {
    List<Contato> contatos = [];
    await BancoDeDados().db!.rawQuery('select * from contatos').then((value){
      value.forEach((element) {
        contatos.add(Contato.fromMap(element));
      });
    });
    return contatos;
  }

  Future<void> insert(Contato contato) async {
    await BancoDeDados().db!
        .rawInsert(
          'insert into contatos (nome, telefone, email) values (?,?,?);', [contato.nome, contato.telefone, contato.email]);
    return;
  }

  Future<void> update(Contato contato) async {
    await BancoDeDados().db!
        .rawUpdate(
          'update contatos set nome = ?, telefone = ?, email = ? where id = ?', [contato.nome, contato.telefone, contato.email, contato.id]);
    return;
  }

  Future<void> delete(Contato contato) async {
    await BancoDeDados().db!
        .rawDelete(
          'delete from contatos where id = ?;', [contato.id]);
    return;
  }
}