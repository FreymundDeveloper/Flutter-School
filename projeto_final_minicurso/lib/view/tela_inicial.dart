import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:projeto_final_minicurso/banco_de_dados.dart';
import 'package:projeto_final_minicurso/controller/controller.dart';
import 'package:projeto_final_minicurso/view/tela_de_cadastro.dart';
import 'package:projeto_final_minicurso/view/tela_de_visualizacao.dart';


class TelaInicial extends StatefulWidget {

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  Controller controller = Controller();
  bool loading = true;
  LocationData? local;
  String _fotoTirada = '';
  ImagePicker picker = ImagePicker();

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
        onPressed: () async{
          final fotoDaCamera = await picker.getImage(source: ImageSource.camera, imageQuality: 25, maxHeight: 1024, maxWidth: 1024);
          final bytes = await fotoDaCamera!.readAsBytes();
          _fotoTirada = base64.encode(bytes);

          await Location.instance.getLocation().then((value) {local=value;});

          if (_fotoTirada != '') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {
              return TelaDeCadastro(_fotoTirada,'${local!.latitude!.toStringAsFixed(4)}','${local!.longitude!.toStringAsFixed(4)}');
            } ));
          }
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
          'Latitude:${controller.fotos[index].latitude!} -/- Longitude:${controller.fotos[index].longitude!}\nData:${controller.fotos[index].data!}'
        ), isThreeLine: true,
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c) {return TelaDeVisualizacao(index);} ));
        },
    );
  }  
}