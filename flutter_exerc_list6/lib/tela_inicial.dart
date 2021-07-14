import 'package:flutter/material.dart';
import 'package:flutter_exerc_list6/tela_localizacao.dart';
import 'package:flutter_exerc_list6/tela_sensores.dart';

class TelaInicial extends StatelessWidget {
  TelaSensores sensores = TelaSensores();
  TelaLocalizacao localizacao = TelaLocalizacao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Container(child: localizacao,)),
          Divider(thickness: 2,color: Colors.black,),
          Flexible(child: Container(child: sensores,),)
        ],
      ),
    );
  }
}