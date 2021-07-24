import 'package:projeto_final_minicurso/banco_de_dados.dart';
import 'package:projeto_final_minicurso/models/foto.dart';

class FotosRepository {
  Future<List<Foto>> selectAll() async {
    List<Foto> fotos = [];
    await BancoDeDados().db!.rawQuery('select * from galeria6').then((value){
      value.forEach((element) {
        fotos.add(Foto.fromMap(element));
      });
    });
    return fotos;
  }

  Future<void> insert(Foto fotos) async {
    await BancoDeDados().db!
        .rawInsert(
          'insert into galeria6 (foto, titulo, comentario, latitude, longitude, data) values (?,?,?,?,?,?);', [
            fotos.foto, fotos.titulo, fotos.comentario, fotos.latitude, fotos.longitude, fotos.data
          ]);
    return;
  }

  Future<void> update(Foto fotos) async {
    await BancoDeDados().db!
        .rawUpdate(
          'update galeria6 set foto = ?, titulo = ?, comentario = ?, latitude = ?, longitude = ?, data = ?, where id = ?', [
            fotos.foto, fotos.titulo, fotos.comentario, fotos.latitude, fotos.longitude, fotos.data, fotos.id
          ]);
    return;
  }

  Future<void> delete(Foto fotos) async {
    await BancoDeDados().db!
        .rawDelete(
          'delete from galeria6 where id = ?;', [fotos.id]);
    return;
  }
}