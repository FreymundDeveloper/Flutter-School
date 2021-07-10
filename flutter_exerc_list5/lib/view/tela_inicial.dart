import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_exerc_list5/controller/receber_foto.dart';
import 'package:flutter_exerc_list5/model/armazenar_foto.dart';
import 'package:flutter_exerc_list5/view/tela_secundaria.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TelaController telaController = TelaController();
  ImagePicker picker = ImagePicker();
  Image? _image;
  String foto = '';
  String _salva = '';
  bool inicio = true;

  void salva(){
    String dado;

    dado = foto;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c){ return TelaSecundaria(dado);}));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camêra'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: _mostrarImagem(),
            ),
          ),Container(child: ElevatedButton(
            onPressed: () async {
              final escolhida = await picker.getImage(source: ImageSource.camera);
              var bytes = await escolhida!.readAsBytes();
              foto = base64.encode(bytes);
              setState(() {
                _image = Image.memory(bytes);
              });
            }, child: Text('FOTO'),),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salva();
        },
        child: Icon(Icons.label_off_outlined),
      ),
    );
  }
  _mostrarImagem(){
    telaController.confirmaRetorna();
    _salva = telaController.retorno;
    if (_image == null && _salva == '' && inicio == true) {
      return Text('Escolha uma foto');
    } else if(inicio == true && _salva == ''){
      inicio = false;
      return _image;
    }else{
      var verif = base64.decode(_salva);
      _image = Image.memory(verif);
      return _image;
    }
    
  }
}