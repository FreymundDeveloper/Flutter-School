import 'package:flutter/material.dart';
import 'package:projeto_final_minicurso/banco_de_dados.dart';
import 'package:projeto_final_minicurso/controller/controller.dart';
import 'package:projeto_final_minicurso/view/tela_de_visualizacao.dart';


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
        title: Text('Galeria de Fotos'),
        centerTitle: true,
      ),
      body: loading
          ? Center(
            child: CircularProgressIndicator(),
          )
          : _listaExistente(), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaDeCadastro();} ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _listaExistente() {
    return Column(
      children: [
        _lista(),
      ],
    );
  }

  _lista() {
    return controller.fotos.isEmpty
          ? Expanded(//flex: 7, 
              child: Center(
                child: Text('Não a fotos na galeria'),
              )
          )
          : Flexible(//flex: 7,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _contatosWidget(index);
                },
                itemCount: controller.fotos.length,
              ),
          );
  }

  _contatosWidget(int index) {
    return ListTile(
      title: Text(controller.fotos[index].titulo!),
        subtitle: Text(
          '${controller.fotos[index].latitude!} - ${controller.fotos[index].longitude!}\n${controller.fotos[index].data!}'
        ), isThreeLine: true,
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaDeVisualizacao(index);} ));
        },
    );
  }
}