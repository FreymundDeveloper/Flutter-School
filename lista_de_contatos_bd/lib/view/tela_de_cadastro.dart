import 'package:flutter/material.dart';
import 'package:lista_de_contatos_bd/banco_de_dados.dart';
import 'package:lista_de_contatos_bd/controller/controller.dart';
import 'package:lista_de_contatos_bd/view/tela_inicial.dart';

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
        title: Text('Cadastrar Contato'),
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

  _cadastrarContato() async {
    await controller.cadastrar();
    await carregar();
  }

  _telaCadastro() {
    return Column(
      children: [
        _labelNome(),
        _caixaNome(),
        _labelTelefone(),
        _caixaTelefone(),
        _labelEmail(),
        _caixaEmail(),
        _botao(),
      ],
    );
  }

  _retorno(){
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaInicial();} ));
  }

  _botao() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: (){
            _cadastrarContato();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaInicial();} ));
          },
          child: Text('Cadastrar'),
        ),
      ),
    );
  }

  _labelNome() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Text('Digite o Nome:')
        ],
      ),
    );
  }

  _caixaNome() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: TextField(
          controller: controller.nomeController,
        ),
        margin: EdgeInsets.all(10),
      );
  }

   _labelTelefone() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Text('Digite o Telefone:')
        ],
      ),
    );
  }

  _caixaTelefone() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: TextField(
          controller: controller.telefoneController,
        ),
        margin: EdgeInsets.all(10),
      );
  }
  
  _labelEmail() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Text('Digite o Email:')
        ],
      ),
    );
  }

  _caixaEmail() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: TextField(
          controller: controller.emailController,
        ),
        margin: EdgeInsets.all(10),
      );
  }
}