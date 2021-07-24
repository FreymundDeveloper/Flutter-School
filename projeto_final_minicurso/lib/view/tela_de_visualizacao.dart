import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final_minicurso/banco_de_dados.dart';
import 'package:projeto_final_minicurso/controller/controller.dart';
import 'package:projeto_final_minicurso/models/foto.dart';
import 'package:projeto_final_minicurso/view/tela_inicial.dart';

class TelaDeVisualizacao extends StatefulWidget {
  int identificacao = -1;

  TelaDeVisualizacao(this.identificacao);

  @override
  _TelaDeVisualizacaoState createState() => _TelaDeVisualizacaoState();
}

class _TelaDeVisualizacaoState extends State<TelaDeVisualizacao> {
  Controller controller = Controller();
  bool loading = true;
  Image? _foto_selecionada;
  
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
        title: loading ? Text('Carregando..') : _tituloAguardo(),
        centerTitle: true,
        leading: IconButton(onPressed:  _retorno, icon: Icon(Icons.arrow_back),),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _telaAguardo(),
    );
  }

  _removerFoto(int index){
    controller.remover(index).whenComplete(() {});
  }

  _retorno(){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaInicial();} ));
  }

  _tituloAguardo(){
    if (widget.identificacao != -1) {
      return Text(controller.fotos[widget.identificacao].titulo!);
    }
  }

  _telaAguardo() {
    while (widget.identificacao == -1) {
      return Column(children: [Center(child: Text('Carregando...'),)],);
    }
    if (widget.identificacao != -1) {
      return _telaVisualizar();
    }
  }

  _telaVisualizar() {
    return Column(
      children: [
        _comentario(),
        _foto(),
        _botaoExcluir(),
      ],
    );
  }

  _comentario() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Text('${controller.fotos[widget.identificacao].comentario!}')
          ],
        ),
       );
  }

  _foto() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Center(
          child: _extrairFoto(),
        ),
      ),
    );
  }

  _botaoExcluir() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: (){
            _removerFoto(widget.identificacao);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaInicial();} ));
          },
          child: Text('Excluir'),
        ),
      ),
    );
  }

  _extrairFoto() {
    if (controller.fotos[widget.identificacao].foto == null) {
      return Text('Sem foto');
    } else {
      var bytes = controller.fotos[widget.identificacao].foto;
      _foto_selecionada =Image.memory(bytes);
      return _foto_selecionada;
    }

  }
}