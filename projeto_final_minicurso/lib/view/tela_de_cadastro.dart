import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_final_minicurso/banco_de_dados.dart';
import 'package:projeto_final_minicurso/controller/controller.dart';
import 'package:projeto_final_minicurso/view/tela_inicial.dart';

class TelaDeCadastro extends StatefulWidget {
  String fotoString = '';
  String latitude = '';
  String longitude = '';

  TelaDeCadastro(this.fotoString, this.latitude, this.longitude);

  @override
  _TelaDeCadastroState createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  Controller controller = Controller();
  bool loading = true;
  Image? _foto_tirada;
  String data = '';
  var fotosBytes;

   @override
  void initState() {
    super.initState();
    BancoDeDados().openDb().whenComplete(carregar);
  }

  Future<void> carregar() async{
    return await controller.buscarBanco().whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela da Cadastro'),
        centerTitle: true,
        leading: IconButton(onPressed:  _retorno, icon: Icon(Icons.arrow_back),),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _telaCadastro(),
    );
  }

   _retorno(){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaInicial();} ));
  }

  _salvarFoto(fs)  async{
    await controller.cadastrar(fs, widget.latitude, widget.longitude, data);
  }

  _telaCadastro() {
    return Column(
      children: [
        _fotoTirada(),
        _labelTitulo(),
        _caixaTitulo(),
        _labelComentario(),
        _caixaComentario(),
        _botaoSalvar(),
      ],
    );
  }

  _botaoSalvar() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: (){
            _extrairData();
            _salvarFoto(fotosBytes);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaInicial();} ));
          },
          child: Text('Salvar'),
        ),
      ),
    );
  }

  
  _fotoTirada() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Center(
          child: _extrairFoto(),
        ),
      ),
    );
  }

  _labelTitulo() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Text('Titulo:')
        ],
      ),
    );
  }

  _caixaTitulo() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: TextField(
          controller: controller.tituloController,
        ),
        margin: EdgeInsets.all(10),
      );
  }

  _labelComentario() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Text('Comentario:')
        ],
      ),
    );
  }

  _caixaComentario() {
    return Flexible(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: TextField(
            controller: controller.comentarioController,
          ),
          margin: EdgeInsets.all(10),
        ),
    );
  }

  _extrairData(){
    var dataAtual = new DateTime.now();    
    DateFormat dataExtracao = new DateFormat('dd-MM-yyyy');
    String dataDefinitiva = dataExtracao.format(dataAtual);
    data = dataDefinitiva.toString();
  }

  _extrairFoto() {
    var bytes = base64.decode(widget.fotoString);
    fotosBytes = bytes;
    _foto_tirada =Image.memory(bytes);
    return _foto_tirada;
  }
}