import 'package:flutter/material.dart';
import 'package:lista_de_contatos_code_exemp/view/tela_inicial.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}