import 'package:flutter/material.dart';
import 'package:projeto_final_minicurso/banco_de_dados.dart';
import 'package:projeto_final_minicurso/controller/controller.dart';
import 'package:projeto_final_minicurso/view/tela_inicial.dart';

class TelaDeCadastro extends StatefulWidget {

  @override
  _TelaDeCadastroState createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  Controller controller = Controller();
  bool loading = true;

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

  _telaCadastro (){}
}