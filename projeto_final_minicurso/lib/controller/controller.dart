import 'package:flutter/cupertino.dart';
import 'package:projeto_final_minicurso/banco_de_dados_repository.dart';
import 'package:projeto_final_minicurso/models/foto.dart';



class Controller {
  List<Foto> fotos = [];

  FotosRepository repository = FotosRepository();

  //TextEditingController fotoController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController comentarioController = TextEditingController();

  Future<void> buscarBanco() async{
    return await repository.selectAll().then((value) {
      fotos = value;
    });
  }

  Future<void> cadastrar(fotoStr, latitude, longitude, data) async {
    Foto foto = Foto(fotoStr, tituloController.text, comentarioController.text, latitude, longitude, data);
    return await repository.insert(foto).then((value) {
      //fotoController.clear();
      tituloController.clear();
      comentarioController.clear();
    });
  }

  Future<void> remover(int index) async{
    await repository.delete(fotos[index]).whenComplete(() {
      fotos.removeAt(index);
    });
  }
}