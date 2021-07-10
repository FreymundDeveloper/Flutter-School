import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_exerc_list5/model/armazenar_foto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaController {
  TextEditingController codigoFoto = TextEditingController();
  Armazena _valor_string = Armazena(foto: '');
  
  Future<void> armazenafoto(valor) async {
    Armazena string = Armazena();
    string.foto = valor;
    SharedPreferences salva = await SharedPreferences.getInstance();
    salva.setString('Salva', string.foto);
    print(valor);
  }

  Future<void> confirmaRetorna() async{
    Armazena string = Armazena();
    SharedPreferences salva = await SharedPreferences.getInstance();
    string.foto = salva.getString('Salva')??'';
    _valor_string = string;
  }
  get retorno {
      return _valor_string.foto;
      
  }
}
