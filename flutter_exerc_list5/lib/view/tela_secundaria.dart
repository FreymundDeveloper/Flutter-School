import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_exerc_list5/controller/receber_foto.dart';
import 'package:flutter_exerc_list5/model/armazenar_foto.dart';

class TelaSecundaria extends StatefulWidget {
  String imagem = '';

  TelaSecundaria(this.imagem);

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  TelaController telaController = TelaController();
  Image? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem'),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: _image == null ? Text('Nenhuma foto') : _image,
            ),
          ),
          Container(child: ElevatedButton(
            onPressed: () async {
              telaController.armazenafoto(widget.imagem);
            }, child: Text('Salvar'),),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            var bytes = base64.decode(widget.imagem);
            setState(() {
              _image = Image.memory(bytes);
            });
        },
        child: Icon(Icons.image),
      ),
    );
  }
}