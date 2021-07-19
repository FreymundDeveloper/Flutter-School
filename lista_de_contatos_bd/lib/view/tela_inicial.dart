import 'package:flutter/material.dart';
import 'package:lista_de_contatos_bd/banco_de_dados.dart';
import 'package:lista_de_contatos_bd/controller/controller.dart';
import 'package:lista_de_contatos_bd/view/tela_de_cadastro.dart';



class TelaInicial extends StatefulWidget {

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
        title: Text('Lista de Contatos'),
        centerTitle: true,
      ),
      body: loading
          ? Center(
            child: CircularProgressIndicator(),
          )
          : _listaExistente(), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaDeCadastro();} ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _removerContato(int index){
    controller.remover(index).whenComplete(() {
      setState(() {});
    });
  }

  _listaExistente() {
    return Column(
      children: [
        _lista(),
      ],
    );
  }

  _lista() {
    return controller.contatos.isEmpty
          ? Expanded(//flex: 7, 
              child: Center(
                child: Text('Não a contatos existentes'),
              )
          )
          : Flexible(//flex: 7,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  //ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(32),bottomLeft: Radius.circular(32)));
                  return _contatosWidget(index);
                },
                itemCount: controller.contatos.length,
              ),
          );
  }

  _contatosWidget(int index) {
    return ListTile(
      title: Text(controller.contatos[index].nome!),
        subtitle: Text('${controller.contatos[index].telefone!}\n${controller.contatos[index].email!}'), isThreeLine: true,
        trailing: IconButton(
          icon: Icon(Icons.clear), 
          onPressed: () {
              _removerContato(index);
          },
        ),
    );
  }
}